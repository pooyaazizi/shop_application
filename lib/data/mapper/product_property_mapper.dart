import 'package:shop_application/data/dto/product_property_dto.dart';
import 'package:shop_application/domain/entities/product_property_entity.dart';

class ProductPropertyMapper {
  static ProductPropertyEntity toDomain(
    ProductPropertyDto productPropertyDto,
  ) {
    return ProductPropertyEntity(
      productPropertyDto.title ?? '',
      productPropertyDto.value ?? '',
    );
  }

  static List<ProductPropertyEntity> toDomainList(
    List<ProductPropertyDto> productPropertyDtoList,
  ) {
    return productPropertyDtoList
        .map<ProductPropertyEntity>(toDomain)
        .toList();
  }
}
