import 'package:dio/dio.dart';
import 'package:shop_application/core/constants/api_constants.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/error/api_exception.dart';
import 'package:shop_application/data/datasource/banner_datasource.dart';
import 'package:shop_application/data/dto/remote/banner_dto.dart';
import 'package:shop_application/data/mapper/banner_mapper.dart';
import 'package:shop_application/domain/entities/banner_entity.dart';

class BannerRemoteDatasourceImpl
    implements IBannerDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<BannerEntity>> getBanners() async {
    try {
      final response = await _dio.get(
        ApiConstants.bannerEndpoint,
      );
      List<BannerDto> bannerDtoList = response
          .data['items']
          .map<BannerDto>(
            (jsonMapObject) =>
                BannerDto.fromMapJson(jsonMapObject),
          )
          .toList();

      final List<BannerEntity> bannerList =
          BannerMapper.toDomainList(bannerDtoList);
      return bannerList;
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        'An unknown error occurred while fetching banner slider data.',
      );
    }
  }
}
