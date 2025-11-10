import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/bloc/category/category_event.dart';
import 'package:shop_application/bloc/category/category_state.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/data/repository/category_repository.dart';

class CategoryBloc
    extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository categoryRepository =
      locator.get();

  CategoryBloc() : super(CategoryInitiateState()) {
    on<CategoryRequest>((event, emit) async {
      emit(CategoryLoadingState());
      final response = await categoryRepository
          .getCategories();
      emit(CategoryResponseState(response));
    });
  }
}
