import 'package:flutter/material.dart';
import 'package:news/core/enums/requst_state_enum.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/repos/bookmark_repo.dart';
import 'package:news/core/repos/news_repositrey.dart';

class HomeProvider extends ChangeNotifier {
  final INewsRepository newsRepository;
  final IBookmarkRepo bookmarkRepo;
  HomeProvider({required this.newsRepository, required this.bookmarkRepo}) {
    _loadBookmarkStates();
  }

  List<NewsArticleModel> _topHeadlinesArticles = [];
  List<NewsArticleModel> get topHeadlinesArticles => _topHeadlinesArticles;

  String _selectedCategory = "general";
  String get selectedCategory => _selectedCategory;
  List<NewsArticleModel> _categoryArticles = [];
  List<NewsArticleModel> get categoryArticles => _categoryArticles;

  RequestState _topHeadlineRequestState = RequestState.loading;
  RequestState get topHeadlineRequestState => _topHeadlineRequestState;

  RequestState _categoryRequestState = RequestState.loading;
  RequestState get categoryRequestState => _categoryRequestState;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  // Bookmark state tracking
  final Set<String> _bookmarkedUrls = {};

  Future<void> getTopHeadlines() async {
    try {
      _topHeadlineRequestState = RequestState.loading;
      notifyListeners();
      _topHeadlinesArticles = await newsRepository.getTopHeadlines("general");
      _topHeadlineRequestState = RequestState.success;
      notifyListeners();
    } catch (e) {
      _topHeadlineRequestState = RequestState.error;
      notifyListeners();
      _errorMessage = e.toString();
    }
  }

  Future<void> getCategoryArticles({String catagory = "general"}) async {
    try {
      categoryArticles.clear();
      _categoryRequestState = RequestState.loading;
      notifyListeners();
      _categoryArticles = await newsRepository.getTopHeadlines(catagory);
      _categoryRequestState = RequestState.success;
      notifyListeners();
    } catch (e) {
      _categoryRequestState = RequestState.error;
      notifyListeners();
      _errorMessage = e.toString();
    }
  }

  void changeCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Future<void> _loadBookmarkStates() async {
    final bookmarks = await bookmarkRepo.getBookmarks();
    _bookmarkedUrls.clear();
    for (final bookmark in bookmarks) {
      if (bookmark.url != null) {
        _bookmarkedUrls.add(bookmark.url!);
      }
    }
  }

  Future<void> refreshBookmarks() async {
    await _loadBookmarkStates();
    notifyListeners();
  }

  Future<void> toggleBookmark(NewsArticleModel article) async {
    if (article.url == null) return;
    if (_bookmarkedUrls.contains(article.url)) {
      await bookmarkRepo.removeBookmark(article);
      _bookmarkedUrls.remove(article.url);
    } else {
      await bookmarkRepo.saveBookmark(article);
      _bookmarkedUrls.add(article.url!);
    }
    await refreshBookmarks();
  }

  bool isBookmarked(NewsArticleModel article) {
    return _bookmarkedUrls.contains(article.url);
  }
}
