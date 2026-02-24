part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<NewsArticleModel> searchResults;
  const SearchLoaded({required this.searchResults});

  @override
  List<Object> get props => [searchResults];
}

final class SearchError extends SearchState {
  final String message;
  const SearchError({required this.message});

  @override
  List<Object> get props => [message];
}
