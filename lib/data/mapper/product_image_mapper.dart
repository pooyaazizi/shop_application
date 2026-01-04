import 'package:shop_application/core/constants/api_constants.dart';
import 'package:shop_application/data/dto/remote/product_image_dto.dart';
import 'package:shop_application/domain/entities/product_image_entity.dart';

class ProductImageMapper {
  static ProductImageEntity toDomain(
    ProductImageDto productImageDto,
  ) {
    return ProductImageEntity(
      productImageDto.collectionId ?? 'N/A',
      productImageDto.collectionName ?? 'N/A',
      productImageDto.id ?? 'N/A',
      '${ApiConstants.baseUrl}files/${productImageDto.collectionId}/${productImageDto.id}/${productImageDto.imageUrl}',
      productImageDto.productId ?? 'N/a',
    );
  }

  static List<ProductImageEntity> toDomainList(
    List<ProductImageDto> productImageDtos,
  ) {
    return productImageDtos
        .map<ProductImageEntity>(toDomain)
        .toList();
  }
}
