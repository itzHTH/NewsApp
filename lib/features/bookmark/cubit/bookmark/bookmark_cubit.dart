import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/repos/bookmark_repo.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit({required this.bookmarkRepo}) : super(BookmarkLoading());

  final IBookmarkRepo bookmarkRepo;

  Future<void> getBookmarks() async {
    try {
      emit(BookmarkLoading());
      final bookmarks = await bookmarkRepo.getBookmarks();
      emit(BookmarkLoaded(articles: bookmarks));
    } catch (e) {
      emit(BookmarkError(message: e.toString()));
    }
  }

  Future<void> removeBookmark(NewsArticleModel article) async {
    try {
      emit(BookmarkLoading());
      await bookmarkRepo.removeBookmark(article);
      final bookmarks = await bookmarkRepo.getBookmarks();
      emit(BookmarkLoaded(articles: bookmarks));
    } catch (e) {
      emit(BookmarkError(message: e.toString()));
    }
  }

  Future<void> toggleBookmark(NewsArticleModel article) async {
    try {
      // check if the article is already bookmarked
      if (state is BookmarkLoaded) {
        final bookmarks = (state as BookmarkLoaded).articles;
        if (bookmarks.contains(article)) {
          await bookmarkRepo.removeBookmark(article);
        } else {
          await bookmarkRepo.saveBookmark(article);
        }
      }
      final bookmarks = await bookmarkRepo.getBookmarks();
      emit(BookmarkLoaded(articles: bookmarks));
    } catch (e) {
      emit(BookmarkError(message: e.toString()));
    }
  }
}
