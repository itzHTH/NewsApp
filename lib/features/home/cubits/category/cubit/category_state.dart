part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  final List<NewsArticleModel> categoryArticles;

  const CategoryLoaded({required this.categoryArticles});

  @override
  List<Object> get props => [categoryArticles];
}

final class CategoryError extends CategoryState {
  final String message;
  const CategoryError({required this.message});

  @override
  List<Object> get props => [message];
}
