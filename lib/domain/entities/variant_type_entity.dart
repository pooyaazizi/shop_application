import 'package:shop_application/data/dto/remote/variant_type_dto.dart';

class VariantTypeEntity {
  String id;
  String name;
  String title;
  VariantTypeEnum type;

  VariantTypeEntity(
    this.id,
    this.name,
    this.title,
    this.type,
  );
}
