import 'package:news/core/data/remote/api_config.dart';
import 'package:news/core/data/remote/api_service.dart';
import 'package:news/features/home/models/news_article_model.dart';

abstract class IHomeRepository {
  Future<List<NewsArticleModel>> getTopHeadlines(String catagory);

  Future<List<NewsArticleModel>> getEverything();
}

class HomeRepositoryImpl implements IHomeRepository {
  final IApiService apiService;

  HomeRepositoryImpl({required this.apiService});
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
  Future<List<NewsArticleModel>> getEverything() async {
    try {
      var response = await apiService.get(ApiConfig.everythingEndpoint);
      return (response as List<dynamic>)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
