import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/repos/bookmark_repo.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  final IBookmarkRepo bookmarkRepo;
  late final ValueListenable<LazyBox<dynamic>> _listenable;

  BookmarkCubit({required this.bookmarkRepo}) : super(BookmarkLoading()) {
    _listenable = bookmarkRepo.getBookmarksListenable();
    _listenable.addListener(_onBookmarksChanged);
  }

  @override
  Future<void> close() {
    _listenable.removeListener(_onBookmarksChanged);
    return super.close();
  }

  void _onBookmarksChanged() {
    getBookmarks();
  }

  Future<void> getBookmarks() async {
    try {
      final bookmarks = await bookmarkRepo.getBookmarks();
      emit(BookmarkLoaded(articles: bookmarks));
    } catch (e) {
      emit(BookmarkError(message: e.toString()));
    }
  }

  Future<void> removeBookmark(NewsArticleModel article) async {
    try {
      await bookmarkRepo.removeBookmark(article);
      await getBookmarks();
    } catch (e) {
      emit(BookmarkError(message: e.toString()));
    }
  }

  Future<void> toggleBookmark(NewsArticleModel article) async {
    try {
      print("BookmarkCubit: toggleBookmark requested for: ${article.title}");

      // Use the repo to check the real truth in Hive, not the UI state
      final isSaved = await bookmarkRepo.isBookmarked(article);
      print("BookmarkCubit: currently saved status = $isSaved");

      if (isSaved) {
        print("BookmarkCubit: removing bookmark...");
        await bookmarkRepo.removeBookmark(article);
        print("BookmarkCubit: removed successfully.");
      } else {
        print("BookmarkCubit: saving bookmark...");
        await bookmarkRepo.saveBookmark(article);
        print("BookmarkCubit: saved successfully.");
      }

      print("BookmarkCubit: triggering getBookmarks() manually.");
      await getBookmarks();
    } catch (e, stackTrace) {
      print("BookmarkCubit ERROR: $e");
      print(stackTrace);
      emit(BookmarkError(message: e.toString()));
    }
  }

  bool isBookmarked(NewsArticleModel article) {
    if (state is BookmarkLoaded) {
      final bookmarks = (state as BookmarkLoaded).articles;
      // We check by URL because checking the whole object might fail
      // if there are slight differences in DateTime parsing between API and Hive DB.
      return bookmarks.any((b) => b.url == article.url);
    }
    return false;
  }
}
