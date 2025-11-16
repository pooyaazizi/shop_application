import 'package:shop_application/core/constants/api_constants.dart';
import 'package:shop_application/data/dto/category_dto.dart';
import 'package:shop_application/domain/entities/category_entity.dart';

class CategoryMapper {
  static CategoryEntity toDomain(
    CategoryDto categoryDto,
  ) {
    return CategoryEntity(
      categoryDto.collectionId ?? 'N/A',
      categoryDto.collectionName ?? 'N/A',
      categoryDto.collectionId ?? 'N/A',
      categoryDto.title ?? 'N/A',
      categoryDto.color ?? 'N/A',
      '${ApiConstants.baseUrl}files/${categoryDto.collectionId}/${categoryDto.id}/${categoryDto.icon}',
      '${ApiConstants.baseUrl}files/${categoryDto.collectionId}/${categoryDto.id}/${categoryDto.thumbnail}',
    );
  }

  static List<CategoryEntity> toDomainList(
    List<CategoryDto> categoryDtos,
  ) {
    return categoryDtos.map(toDomain).toList();
  }
}
