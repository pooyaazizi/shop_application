import 'package:shop_application/core/constants/api_constants.dart';
import 'package:shop_application/data/dto/product_dto.dart';
import 'package:shop_application/domain/entities/product_entity.dart';

class ProductMapper {
  static ProductEntity toDomain(
    ProductDto productDto,
  ) {
    final int realPrice =
        (productDto.price ?? 0) +
        (productDto.discountPrice ?? 0);

    final int discountPercent =
        (productDto.price != null &&
            productDto.price! > 0)
        ? (((productDto.price! - realPrice) /
                      productDto.price!) *
                  100)
              .round()
        : 0;

    return ProductEntity(
      productDto.category ?? 'N/A',
      productDto.collectionId ?? 'N/A',
      productDto.collectionName ?? 'N/A',
      productDto.description ?? 'N/A',
      productDto.discountPrice ?? 0,
      productDto.id ?? 'N/A',
      productDto.name ?? 'N/A',
      productDto.popularity ?? 'N/A',
      productDto.price ?? 0,
      productDto.quantity ?? 0,
      '${ApiConstants.baseUrl}files/${productDto.collectionId}/${productDto.id}/${productDto.thumbnail}',
      realPrice,
      discountPercent,
    );
  }

  static List<ProductEntity> toDomainList(
    List<ProductDto> prodyctDtos,
  ) {
    return prodyctDtos
        .map<ProductEntity>(toDomain)
        .toList();
  }
}
