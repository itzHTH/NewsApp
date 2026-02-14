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

  RequestState _requestState = RequestState.loading;
  RequestState get requestState => _requestState;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Future<void> getTopHeadlines() async {
    try {
      _requestState = RequestState.loading;
      notifyListeners();
      _topHeadlinesArticles = await homeRepository.getTopHeadlines("general");
      _requestState = RequestState.success;
      notifyListeners();
    } catch (e) {
      _requestState = RequestState.error;
      notifyListeners();
      _errorMessage = e.toString();
    }
  }

  Future<void> getCategoryArticles({String catagory = "general"}) async {
    try {
      categoryArticles.clear();
      _requestState = RequestState.loading;
      notifyListeners();
      _categoryArticles = await homeRepository.getTopHeadlines(catagory);
      _requestState = RequestState.success;
      notifyListeners();
    } catch (e) {
      _requestState = RequestState.error;
      notifyListeners();
      _errorMessage = e.toString();
    }
  }

  void changeCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
