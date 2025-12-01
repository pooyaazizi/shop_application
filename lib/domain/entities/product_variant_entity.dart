import 'package:shop_application/domain/entities/variant_entity.dart';
import 'package:shop_application/domain/entities/variant_type_entity.dart';

class ProductVariantEntity {
  List<VariantEntity> variantList;
  VariantTypeEntity variantType;

  ProductVariantEntity(
    this.variantList,
    this.variantType,
  );
}
