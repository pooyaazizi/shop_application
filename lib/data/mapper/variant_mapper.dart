import 'package:shop_application/data/dto/variant_dto.dart';
import 'package:shop_application/domain/entities/variant_entity.dart';

class VariantMapper {
  static VariantEntity toDomain(
    VariantDto variantDto,
  ) {
    return VariantEntity(
      variantDto.id ?? 'N/A',
      variantDto.name ?? 'N/A',
      variantDto.typeId ?? 'N/A',
      variantDto.value ?? 'N/A',
      variantDto.priceChange ?? 0,
    );
  }

  static List<VariantEntity> toDomainList(
    List<VariantDto> variantDtoList,
  ) {
    return variantDtoList
        .map<VariantEntity>(toDomain)
        .toList();
  }
}
