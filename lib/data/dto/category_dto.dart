class CategoryDto {
  String? collectionId;
  String? collectionName;
  String? id;
  String? title;
  String? color;
  String? icon;
  String? thumbnail;

  CategoryDto(
    this.collectionId,
    this.collectionName,
    this.id,
    this.title,
    this.color,
    this.icon,
    this.thumbnail,
  );

  factory CategoryDto.fromMapJson(
    Map<String, dynamic> jsonMapObject,
  ) {
    return CategoryDto(
      jsonMapObject['collectionId'],
      jsonMapObject['collectionName'],
      jsonMapObject['id'],
      jsonMapObject['title'],
      jsonMapObject['color'],
      jsonMapObject['icon'],
      jsonMapObject['thumbnail'],
    );
  }
}
