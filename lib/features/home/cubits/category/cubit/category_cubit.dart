import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/models/news_article_model.dart';
import 'package:news/core/repos/news_repositrey.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.newsRepository}) : super(CategoryLoading());

  final INewsRepository newsRepository;

  Future<void> getCategoryArticles({String category = "general"}) async {
    emit(CategoryLoading());
    try {
      final categoryArticles = await newsRepository.getEverything(category);
      emit(CategoryLoaded(categoryArticles: categoryArticles));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
