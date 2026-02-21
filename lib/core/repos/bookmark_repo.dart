import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:news/core/data/local/hive_helper.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/features/bookmark/models/bookmark_model.dart';

abstract class IBookmarkRepo {
  Future<List<NewsArticleModel>> getBookmarks();

  Future<void> saveBookmark(NewsArticleModel article);

  Future<void> removeBookmark(NewsArticleModel article);

  Future<bool> isBookmarked(NewsArticleModel article);

  Future<void> clearBookmarks();

  ValueListenable<LazyBox<dynamic>> getBookmarksListenable();
}

class BookmarkRepoImpl implements IBookmarkRepo {
  final HiveHelper _hiveHelper;

  BookmarkRepoImpl(this._hiveHelper);

  @override
  Future<void> clearBookmarks() async {
    await _hiveHelper.clearBoxLazy();
  }

  @override
  Future<List<NewsArticleModel>> getBookmarks() async {
    final List<BookmarkModel> bookmarks = await _hiveHelper
        .getAllLazy<BookmarkModel>();
    return bookmarks.map((e) => e.toEntity()).toList();
  }

  String _getKey(String url) {
    return base64Encode(utf8.encode(url));
  }

  @override
  Future<bool> isBookmarked(NewsArticleModel article) async {
    if (article.url == null) return false;
    return await _hiveHelper.containsKeyLazy(_getKey(article.url!));
  }

  @override
  Future<void> removeBookmark(NewsArticleModel article) async {
    if (article.url == null) return;
    await _hiveHelper.deleteLazy(_getKey(article.url!));
  }

  @override
  Future<void> saveBookmark(NewsArticleModel article) async {
    if (article.url == null) return;
    final bookmark = BookmarkModel.fromEntity(article);
    await _hiveHelper.putLazy(_getKey(article.url!), bookmark);
  }

  @override
  ValueListenable<LazyBox<dynamic>> getBookmarksListenable() {
    return _hiveHelper.getLazyBoxListenable();
  }
}
