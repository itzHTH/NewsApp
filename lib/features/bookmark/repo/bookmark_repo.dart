import 'package:news/core/data/local/hive_helper.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/features/bookmark/data/models/bookmark_model.dart';

abstract class IBookmarkRepo {
  Future<List<NewsArticleModel>> getBookmarks();

  Future<void> saveBookmark(NewsArticleModel article);

  Future<void> removeBookmark(NewsArticleModel article);

  Future<bool> isBookmarked(NewsArticleModel article);

  Future<void> clearBookmarks();
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

  @override
  Future<bool> isBookmarked(NewsArticleModel article) async {
    if (article.url == null) return false;
    return await _hiveHelper.containsKeyLazy(article.url!);
  }

  @override
  Future<void> removeBookmark(NewsArticleModel article) async {
    if (article.url == null) return;
    await _hiveHelper.deleteLazy(article.url!);
  }

  @override
  Future<void> saveBookmark(NewsArticleModel article) async {
    if (article.url == null) return;
    final bookmark = BookmarkModel.fromEntity(article);
    await _hiveHelper.putLazy(article.url!, bookmark);
  }
}
