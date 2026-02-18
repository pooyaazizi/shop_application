import 'package:dio/dio.dart';
import 'package:shop_application/core/constants/api_constants.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/error/api_exception.dart';
import 'package:shop_application/data/datasource/category_product_datasource.dart';
import 'package:shop_application/data/dto/remote/product_dto.dart';
import 'package:shop_application/data/mapper/product_mapper.dart';
import 'package:shop_application/domain/entities/product_entity.dart';

class CategoryProductDatasourceImpl
    implements ICategoryProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductEntity>> getProductsByCategoryId(
    String categoryId,
  ) async {
    try {
      final Response response;
      if (categoryId == 'qnbj8d6b9lzzpn8') {
        response = await _dio.get(
          ApiConstants.productEndpoint,
        );
      } else {
        Map<String, String> queryParam = {
          'filter': 'category="$categoryId"',
        };
        response = await _dio.get(
          ApiConstants.productEndpoint,
          queryParameters: queryParam,
        );
      }

      List<ProductDto> productDtoList = response
          .data['items']
          .map<ProductDto>(
            (jsonMapObject) =>
                ProductDto.fromMapJson(jsonMapObject),
          )
          .toList();

      List<ProductEntity> productList =
          ProductMapper.toDomainList(productDtoList);
      return productList;
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        'An unknown error occurred while loading the products by category',
      );
    }
  }
}
