import 'package:dio/dio.dart';
import 'package:shop_application/core/constants/api_constants.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/error/api_exception.dart';
import 'package:shop_application/data/datasource/product_datasource.dart';
import 'package:shop_application/data/dto/product_dto.dart';
import 'package:shop_application/data/mapper/product_mapper.dart';
import 'package:shop_application/domain/entities/product_entity.dart';

class ProductRemoteDatasourceImpl
    implements IProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      final response = await _dio.get(
        ApiConstants.productEndpoint,
      );

      final List<ProductDto> productDtos = response
          .data['items']
          .map<ProductDto>(
            (jsonMapObject) =>
                ProductDto.fromMapJson(jsonMapObject),
          )
          .toList();

      final List<ProductEntity> productList =
          ProductMapper.toDomainList(productDtos);
      return productList;
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        'An unknown error occurred while loading the products',
      );
    }
  }

  @override
  Future<List<ProductEntity>>
  getBestSellerProducts() async {
    try {
      Map<String, String> queryParam = {
        'filter': 'popularity="Best Seller"',
      };
      final response = await _dio.get(
        ApiConstants.productEndpoint,
        queryParameters: queryParam,
      );

      final List<ProductDto> productDtos = response
          .data['items']
          .map<ProductDto>(
            (jsonMapObject) =>
                ProductDto.fromMapJson(jsonMapObject),
          )
          .toList();

      final List<ProductEntity> productList =
          ProductMapper.toDomainList(productDtos);
      return productList;
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        'An unknown error occurred while loading the products',
      );
    }
  }

  @override
  Future<List<ProductEntity>>
  getHotestProducts() async {
    try {
      Map<String, String> queryParam = {
        'filter': 'popularity="Hotest"',
      };
      final response = await _dio.get(
        ApiConstants.productEndpoint,
        queryParameters: queryParam,
      );

      final List<ProductDto> productDtos = response
          .data['items']
          .map<ProductDto>(
            (jsonMapObject) =>
                ProductDto.fromMapJson(jsonMapObject),
          )
          .toList();

      final List<ProductEntity> productList =
          ProductMapper.toDomainList(productDtos);
      return productList;
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        'An unknown error occurred while loading the products',
      );
    }
  }
}
