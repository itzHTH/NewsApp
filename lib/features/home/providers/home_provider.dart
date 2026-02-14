import 'package:flutter/material.dart';
import 'package:news/core/enums/requst_state_enum.dart';
import 'package:news/features/home/models/news_article_model.dart';
import 'package:news/features/home/repos/home_repositrey.dart';

class HomeProvider extends ChangeNotifier {
  final IHomeRepository homeRepository;
  HomeProvider({required this.homeRepository});

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

  Future<void> getTopHeadlines() async {
    try {
      _topHeadlineRequestState = RequestState.loading;
      notifyListeners();
      _topHeadlinesArticles = await homeRepository.getTopHeadlines("general");
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
      _categoryArticles = await homeRepository.getTopHeadlines(catagory);
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
}
