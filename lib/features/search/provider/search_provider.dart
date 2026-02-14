import 'package:flutter/material.dart';
import 'package:news/core/enums/requst_state_enum.dart';
import 'package:news/core/repos/news_repositrey.dart';
import 'package:news/core/models/news_article_model.dart';

class SearchProvider extends ChangeNotifier {
  final INewsRepository newsRepository;

  SearchProvider({required this.newsRepository});

  List<NewsArticleModel> _searchResults = [];
  List<NewsArticleModel> get searchResults => _searchResults;

  RequestState _searchState = RequestState.loading;
  RequestState get searchState => _searchState;

  Future<void> search({String? query}) async {
    _searchState = RequestState.loading;
    notifyListeners();
    try {
      _searchResults = await newsRepository.getEverything(
        query?.isEmpty ?? true ? "iraq news" : query!,
      );
      _searchState = RequestState.success;
      notifyListeners();
    } catch (e) {
      _searchState = RequestState.error;
      notifyListeners();
    }
  }
}
