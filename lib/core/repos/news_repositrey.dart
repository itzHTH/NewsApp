import 'package:news/core/data/remote/api_config.dart';
import 'package:news/core/data/remote/api_service.dart';
import 'package:news/core/models/news_article_model.dart';

abstract class INewsRepository {
  Future<List<NewsArticleModel>> getTopHeadlines(String catagory);

  Future<List<NewsArticleModel>> getEverything(String query);
}

class NewsRepositoryImpl implements INewsRepository {
  final IApiService apiService;

  NewsRepositoryImpl({required this.apiService});
  @override
  Future<List<NewsArticleModel>> getTopHeadlines(String catagory) async {
    try {
      var response = await apiService.get(
        ApiConfig.topHeadlinesEndpoint,
        queryParameters: {"category": catagory},
      );
      return (response as List<dynamic>)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<NewsArticleModel>> getEverything(String query) async {
    try {
      var response = await apiService.get(
        ApiConfig.everythingEndpoint,
        queryParameters: {"q": query},
      );
      return (response as List<dynamic>)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
