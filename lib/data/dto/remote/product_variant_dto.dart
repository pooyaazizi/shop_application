import 'package:shop_application/domain/entities/variant_entity.dart';
import 'package:shop_application/domain/entities/variant_type_entity.dart';

class ProductVariantDto {
  List<VariantEntity> variant;
  VariantTypeEntity variantType;

  ProductVariantDto(this.variant, this.variantType);
}
