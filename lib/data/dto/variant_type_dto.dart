class VariantTypeDto {
  String? id;
  String? name;
  String? title;
  VariantTypeEnum? type;

  VariantTypeDto(
    this.id,
    this.name,
    this.title,
    this.type,
  );

  factory VariantTypeDto.fromMapJson(
    Map<String, dynamic> jsonMapObject,
  ) {
    return VariantTypeDto(
      jsonMapObject['id'],
      jsonMapObject['name'],
      jsonMapObject['title'],
      _getVariantType(jsonMapObject['type']),
    );
  }
}

VariantTypeEnum _getVariantType(String? type) {
  switch (type) {
    case 'Color':
      return VariantTypeEnum.COLOR;
    case 'Storage':
      return VariantTypeEnum.STORAGE;
    case 'Voltage':
      return VariantTypeEnum.VOLTAGE;
    default:
      return VariantTypeEnum.NULL;
  }
}

enum VariantTypeEnum { COLOR, STORAGE, VOLTAGE, NULL }
