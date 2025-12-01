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
