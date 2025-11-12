class BannerDto {
  String? categoryId;
  String? collectionId;
  String? collectionName;
  String? id;
  String? thumbnail;

  BannerDto(
    this.categoryId,
    this.collectionId,
    this.collectionName,
    this.id,
    this.thumbnail,
  );

  factory BannerDto.fromMapJson(
    Map<String, dynamic> jsonMapObject,
  ) {
    return BannerDto(
      jsonMapObject['categoryId'],
      jsonMapObject['collectionId'],
      jsonMapObject['collectionName'],
      jsonMapObject['id'],
      jsonMapObject['thumbnail'],
    );
  }
}
