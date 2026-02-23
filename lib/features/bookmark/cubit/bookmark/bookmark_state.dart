part of 'bookmark_cubit.dart';

sealed class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

final class BookmarkLoading extends BookmarkState {}

final class BookmarkLoaded extends BookmarkState {
  final List<NewsArticleModel> bookmarkArticles;
  const BookmarkLoaded({required this.bookmarkArticles});
  @override
  List<Object> get props => [bookmarkArticles];
}

final class BookmarkError extends BookmarkState {
  final String message;
  const BookmarkError({required this.message});
  @override
  List<Object> get props => [message];
}
