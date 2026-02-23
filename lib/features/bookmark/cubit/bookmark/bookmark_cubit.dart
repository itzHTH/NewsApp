import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/repos/bookmark_repo.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  final IBookmarkRepo bookmarkRepo;

  BookmarkCubit({required this.bookmarkRepo}) : super(BookmarkLoading()) {
    bookmarkRepo.getBookmarksListenable().addListener(_onBookmarksChanged);
  }

  @override
  Future<void> close() {
    bookmarkRepo.getBookmarksListenable().removeListener(_onBookmarksChanged);
    return super.close();
  }

  void _onBookmarksChanged() {
    getBookmarks();
  }

  Future<void> getBookmarks() async {
    try {
      emit(BookmarkLoaded(bookmarkArticles: await bookmarkRepo.getBookmarks()));
    } catch (e) {
      emit(BookmarkError(message: e.toString()));
    }
  }

  Future<void> removeBookmark(NewsArticleModel article) async {
    try {
      await bookmarkRepo.removeBookmark(article);
    } catch (e) {
      emit(BookmarkError(message: e.toString()));
    }
  }

  Future<void> saveBookmark(NewsArticleModel article) async {
    try {
      await bookmarkRepo.saveBookmark(article);
    } catch (e) {
      emit(BookmarkError(message: e.toString()));
    }
  }

  Future<void> toggleBookmark(NewsArticleModel article) async {
    try {
      if (await bookmarkRepo.isBookmarked(article)) {
        await removeBookmark(article);
      } else {
        await saveBookmark(article);
      }

      await getBookmarks();
    } catch (e) {
      emit(BookmarkError(message: e.toString()));
    }
  }

  bool isBookmarked(NewsArticleModel article) {
    if (state is BookmarkLoaded) {
      final bookmarks = (state as BookmarkLoaded).bookmarkArticles;
      return bookmarks.any((b) => b.url == article.url);
    }
    return false;
  }
}
