class CardItemEntity {
  String productId;
  String collectionId;
  String thumbnail;
  int discountPrice;
  int price;
  String name;
  String category;
  int realPrice;
  double discountPercent;

  CardItemEntity(
    this.productId,
    this.collectionId,
    this.thumbnail,
    this.discountPrice,
    this.price,
    this.name,
    this.category,
    this.realPrice,
    this.discountPercent,
  );
}
