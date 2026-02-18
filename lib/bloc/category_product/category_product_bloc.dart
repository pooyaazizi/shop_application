import 'package:bloc/bloc.dart';
import 'package:shop_application/bloc/category_product/category_product_event.dart';
import 'package:shop_application/bloc/category_product/category_product_state.dart';

import 'package:shop_application/data/repository/category_product_repository.dart';

class CategoryProductBloc
    extends
        Bloc<
          CategoryProductEvent,
          CategoryProductState
        > {
  final ICategoryProductRepository
  _categoryProductRepository;
  CategoryProductBloc(this._categoryProductRepository)
    : super(CategoryProductInitializeState()) {
    on<CategoryProductInitializeEvent>((
      event,
      emit,
    ) async {
      emit(CategoryProductLoadingState());

      final productResult =
          await _categoryProductRepository
              .getProductsByCategory(event.categoryId);

      emit(
        CategoryProductResponseState(productResult),
      );
    });
  }
}
