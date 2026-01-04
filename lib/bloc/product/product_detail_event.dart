import 'package:shop_application/domain/entities/product_entity.dart';

abstract class ProductDetailEvent {}

class PrtoductDetailInitializeEvent
    extends ProductDetailEvent {
  String productId;
  String categoryId;
  PrtoductDetailInitializeEvent(
    this.productId,
    this.categoryId,
  );
}

class ProductAddToBasket extends ProductDetailEvent {
  ProductEntity product;
  ProductAddToBasket(this.product);
}
