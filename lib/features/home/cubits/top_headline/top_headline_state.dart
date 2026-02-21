part of 'top_headline_cubit.dart';

sealed class TopHeadlineState extends Equatable {
  const TopHeadlineState();

  @override
  List<Object> get props => [];
}

final class TopHeadlineLoading extends TopHeadlineState {}

final class TopHeadlineLoaded extends TopHeadlineState {
  final List<NewsArticleModel> topHeadlinesArticles;
  const TopHeadlineLoaded({required this.topHeadlinesArticles});
  @override
  List<Object> get props => [topHeadlinesArticles];
}

final class TopHeadlineError extends TopHeadlineState {
  final String errorMessage;
  const TopHeadlineError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
