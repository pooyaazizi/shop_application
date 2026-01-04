import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/bloc/product/product_detail_event.dart';
import 'package:shop_application/bloc/product/product_detail_state.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/data/dto/local/card_item_dto.dart';
import 'package:shop_application/data/repository/card_item_repository.dart';
import 'package:shop_application/data/repository/product_detail_repository.dart';

class ProductDetailBloc
    extends
        Bloc<ProductDetailEvent, ProductDetailState> {
  final IProductDetailRepository
  _productDetailRepository = locator.get();
  final ICardItemRepository _cardItemRepository =
      locator.get();
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

    on<ProductAddToBasket>((event, emit) async {
      var cardItem = CardItemDto(
        event.product.id,
        event.product.collectionId,
        event.product.thumbnail,
        event.product.discountPrice,
        event.product.price,
        event.product.name,
        event.product.category,
        event.product.realPrice,
        event.product.discountPercent,
      );
      _cardItemRepository.addProductToBasket(cardItem);
    });
  }
}
