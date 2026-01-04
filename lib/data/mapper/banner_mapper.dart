import 'package:shop_application/core/constants/api_constants.dart';
import 'package:shop_application/data/dto/remote/banner_dto.dart';
import 'package:shop_application/domain/entities/banner_entity.dart';

class BannerMapper {
  static BannerEntity toDomain(BannerDto bannerDto) {
    return BannerEntity(
      bannerDto.categoryId ?? 'N/A',
      bannerDto.collectionId ?? 'N/A',
      bannerDto.collectionName ?? 'N/A',
      bannerDto.id ?? 'N/A',
      '${ApiConstants.baseUrl}files/${bannerDto.collectionId}/${bannerDto.id}/${bannerDto.thumbnail}',
    );
  }

  static List<BannerEntity> toDomainList(
    List<BannerDto> bannerDtos,
  ) {
    return bannerDtos.map(toDomain).toList();
  }
}
