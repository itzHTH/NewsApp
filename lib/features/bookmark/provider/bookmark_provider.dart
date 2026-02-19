import 'package:flutter/material.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/features/bookmark/repo/bookmark_repo.dart';

class BookmarkProvider extends ChangeNotifier {
  List<NewsArticleModel> _bookmarks = [];
  List<NewsArticleModel> get bookmarks => _bookmarks;

  final IBookmarkRepo _bookmarkRepo;

  BookmarkProvider(this._bookmarkRepo);

  Future<void> getBookmarks() async {
    _bookmarks = await _bookmarkRepo.getBookmarks();
    notifyListeners();
  }

  Future<void> saveBookmark(NewsArticleModel article) async {
    await _bookmarkRepo.saveBookmark(article);
    getBookmarks();
  }

  Future<void> removeBookmark(NewsArticleModel article) async {
    await _bookmarkRepo.removeBookmark(article);
    getBookmarks();
  }

  Future<bool> isBookmarked(NewsArticleModel article) async {
    return await _bookmarkRepo.isBookmarked(article);
  }

  Future<void> clearBookmarks() async {
    await _bookmarkRepo.clearBookmarks();
    getBookmarks();
  }
}
