import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/repos/news_repositrey.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final INewsRepository newsRepository;

  SearchCubit({required this.newsRepository}) : super(SearchLoading()) {
    search();
  }

  Future<void> search({String? query}) async {
    emit(SearchLoading());
    try {
      final results = await newsRepository.getEverything(
        query?.isEmpty ?? true ? 'iraq news' : query!,
      );
      emit(SearchLoaded(searchResults: results));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}
