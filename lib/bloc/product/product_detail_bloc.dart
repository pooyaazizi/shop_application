import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/bloc/product/product_detail_event.dart';
import 'package:shop_application/bloc/product/product_detail_state.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/data/repository/product_detail_repository.dart';

class ProductDetailBloc
    extends
        Bloc<ProductDetailEvent, ProductDetailState> {
  final IProductDetailRepository
  _productDetailRepository = locator.get();
  ProductDetailBloc()
    : super(ProductDetailInitiatState()) {
    on<PrtoductDetailInitializeEvent>((
      event,
      emit,
    ) async {
      emit(ProductDetailLoadingState());
      final productGalleryResult =
          await _productDetailRepository.getGallery(
            event.productId,
          );
      final productVariantResult =
          await _productDetailRepository
              .getProductVariants(event.productId);
      final productCategoryResult =
          await _productDetailRepository
              .getProductCategory(event.categoryId);

      final productPropertyResult =
          await _productDetailRepository
              .getProductProperties(event.productId);

      emit(
        ProductDetailResponseState(
          productGalleryResult,
          productVariantResult,
          productCategoryResult,
          productPropertyResult,
        ),
      );
    });
  }
}
