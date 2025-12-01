class ProductImageDto {
  String? collectionId;
  String? collectionName;
  String? id;
  String? imageUrl;
  String? productId;

  ProductImageDto(
    this.collectionId,
    this.collectionName,
    this.id,
    this.imageUrl,
    this.productId,
  );

  factory ProductImageDto.fromMapJson(
    Map<String, dynamic> jsonMapObject,
  ) {
    return ProductImageDto(
      jsonMapObject['collectionId'],
      jsonMapObject['collectionName'],
      jsonMapObject['id'],
      jsonMapObject['image'],
      jsonMapObject['product_id'],
    );
  }
}
