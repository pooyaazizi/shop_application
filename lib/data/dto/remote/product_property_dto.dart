class ProductPropertyDto {
  String? title;
  String? value;

  ProductPropertyDto(this.title, this.value);

  factory ProductPropertyDto.fromMapJson(
    Map<String, dynamic> jsonMapObject,
  ) {
    return ProductPropertyDto(
      jsonMapObject['title'],
      jsonMapObject['value'],
    );
  }
}
