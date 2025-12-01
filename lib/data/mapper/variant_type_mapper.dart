import 'package:shop_application/data/dto/variant_type_dto.dart';
import 'package:shop_application/domain/entities/variant_type_entity.dart';

class VariantTypeMapper {
  static VariantTypeEntity toDomain(
    VariantTypeDto variantTypeDto,
  ) {
    return VariantTypeEntity(
      variantTypeDto.id ?? 'N/A',
      variantTypeDto.name ?? 'N/A',
      variantTypeDto.title ?? 'N/A',
      variantTypeDto.type ?? VariantTypeEnum.NULL,
    );
  }

  static List<VariantTypeEntity> toDomainList(
    List<VariantTypeDto> variantTypeDtos,
  ) {
    return variantTypeDtos
        .map<VariantTypeEntity>(toDomain)
        .toList();
  }
}
