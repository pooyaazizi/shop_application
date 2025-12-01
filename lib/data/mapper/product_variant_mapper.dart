import 'package:shop_application/data/dto/product_variant_dto.dart';
import 'package:shop_application/domain/entities/product_variant_entity.dart';

class ProductVariantMapper {
  static ProductVariantEntity toDomain(
    ProductVariantDto productVariantDto,
  ) {
    return ProductVariantEntity(
      productVariantDto.variant,
      productVariantDto.variantType,
    );
  }

  static List<ProductVariantEntity> toDomainList(
    List<ProductVariantDto> productVariantDtoList,
  ) {
    return productVariantDtoList
        .map<ProductVariantEntity>(toDomain)
        .toList();
  }
}
