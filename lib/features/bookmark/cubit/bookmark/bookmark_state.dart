part of 'bookmark_cubit.dart';

sealed class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

final class BookmarkLoading extends BookmarkState {}

final class BookmarkLoaded extends BookmarkState {
  final List<NewsArticleModel> articles;
  const BookmarkLoaded({required this.articles});
  @override
  List<Object> get props => [articles];
}

final class BookmarkError extends BookmarkState {
  final String message;
  const BookmarkError({required this.message});
  @override
  List<Object> get props => [message];
}
