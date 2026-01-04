class ProductDto {
  String? category;
  String? collectionId;
  String? collectionName;
  String? description;
  int? discountPrice;
  String? id;
  String? name;
  String? popularity;
  int? price;
  int? quantity;
  String? thumbnail;

  ProductDto(
    this.category,
    this.collectionId,
    this.collectionName,
    this.description,
    this.discountPrice,
    this.id,
    this.name,
    this.popularity,
    this.price,
    this.quantity,
    this.thumbnail,
  );

  factory ProductDto.fromMapJson(
    Map<String, dynamic> jsonMapObject,
  ) {
    return ProductDto(
      jsonMapObject['category'],
      jsonMapObject['collectionId'],
      jsonMapObject['collectionName'],
      jsonMapObject['description'],
      jsonMapObject['discount_price'],
      jsonMapObject['id'],
      jsonMapObject['name'],
      jsonMapObject['popularity'],
      jsonMapObject['price'],
      jsonMapObject['quantity'],
      jsonMapObject['thumbnail'],
    );
  }
}
