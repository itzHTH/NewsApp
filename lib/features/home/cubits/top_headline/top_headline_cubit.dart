import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/repos/news_repositrey.dart';

part 'top_headline_state.dart';

class TopHeadlineCubit extends Cubit<TopHeadlineState> {
  TopHeadlineCubit({required this.newsRepository})
    : super(TopHeadlineLoading());

  final INewsRepository newsRepository;

  Future<void> getTopHeadlines() async {
    try {
      emit(TopHeadlineLoading());
      final topHeadlinesArticles = await newsRepository.getTopHeadlines(
        "general",
      );
      emit(TopHeadlineLoaded(topHeadlinesArticles: topHeadlinesArticles));
    } catch (e) {
      emit(TopHeadlineError(errorMessage: e.toString()));
    }
  }
}
