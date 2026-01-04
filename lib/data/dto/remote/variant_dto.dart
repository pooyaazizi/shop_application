class VariantDto {
  String? id;
  String? name;
  String? typeId;
  String? value;
  int? priceChange;

  VariantDto(
    this.id,
    this.name,
    this.typeId,
    this.value,
    this.priceChange,
  );

  factory VariantDto.fromMapJson(
    Map<String, dynamic> jsonMapObject,
  ) {
    return VariantDto(
      jsonMapObject['id'],
      jsonMapObject['name'],
      jsonMapObject['type_id'],
      jsonMapObject['value'],
      jsonMapObject['priceChange'],
    );
  }
}
