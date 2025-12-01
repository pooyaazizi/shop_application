import 'package:dio/dio.dart';
import 'package:shop_application/core/constants/api_constants.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/error/api_exception.dart';
import 'package:shop_application/data/datasource/product_detail_datasource.dart';
import 'package:shop_application/data/dto/category_dto.dart';
import 'package:shop_application/data/dto/product_image_dto.dart';
import 'package:shop_application/data/dto/product_property_dto.dart';
import 'package:shop_application/data/dto/variant_dto.dart';
import 'package:shop_application/data/dto/variant_type_dto.dart';
import 'package:shop_application/data/mapper/category_mapper.dart';
import 'package:shop_application/data/mapper/product_image_mapper.dart';
import 'package:shop_application/data/mapper/product_property_mapper.dart';
import 'package:shop_application/data/mapper/variant_mapper.dart';
import 'package:shop_application/data/mapper/variant_type_mapper.dart';
import 'package:shop_application/domain/entities/category_entity.dart';
import 'package:shop_application/domain/entities/product_image_entity.dart';
import 'package:shop_application/domain/entities/product_property_entity.dart';
import 'package:shop_application/domain/entities/product_variant_entity.dart';
import 'package:shop_application/domain/entities/variant_entity.dart';
import 'package:shop_application/domain/entities/variant_type_entity.dart';

class ProductDetailRemoteDatasourceImpl
    implements IProductDetailDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImageEntity>> getGallery(
    String productId,
  ) async {
    try {
      Map<String, String> queryParam = {
        'filter': 'product_id="${productId}"',
      };
      final response = await _dio.get(
        ApiConstants.galleryEndpoint,
        queryParameters: queryParam,
      );

      final List<ProductImageDto> productImageDtos =
          response.data['items']
              .map<ProductImageDto>(
                (jsonMapObject) =>
                    ProductImageDto.fromMapJson(
                      jsonMapObject,
                    ),
              )
              .toList();

      final List<ProductImageEntity> productImageList =
          ProductImageMapper.toDomainList(
            productImageDtos,
          );
      return productImageList;
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        'An unknown error occurred while loading the gallery',
      );
    }
  }

  @override
  Future<List<VariantTypeEntity>>
  getVariantTypes() async {
    try {
      final response = await _dio.get(
        ApiConstants.variantTypeEndpoint,
      );

      final List<VariantTypeDto> variantTypeDtoList =
          response.data['items']
              .map<VariantTypeDto>(
                (jsonMapObject) =>
                    VariantTypeDto.fromMapJson(
                      jsonMapObject,
                    ),
              )
              .toList();

      final List<VariantTypeEntity> variantTypeList =
          VariantTypeMapper.toDomainList(
            variantTypeDtoList,
          );
      return variantTypeList;
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        'An unknown error occurred while loading the variant type',
      );
    }
  }

  @override
  Future<List<VariantEntity>> getVariants(
    String productId,
  ) async {
    try {
      Map<String, String> queryParam = {
        'filter': 'product_id="${productId}"',
      };
      final response = await _dio.get(
        ApiConstants.varientEndpoint,
        queryParameters: queryParam,
      );

      final List<VariantDto> variantDtoList = response
          .data['items']
          .map<VariantDto>(
            (jsonMapObject) =>
                VariantDto.fromMapJson(jsonMapObject),
          )
          .toList();

      final List<VariantEntity> variantList =
          VariantMapper.toDomainList(variantDtoList);
      return variantList;
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        'An unknown error occurred while loading the variant',
      );
    }
  }

  @override
  Future<List<ProductVariantEntity>>
  getProductVariants(String productId) async {
    final variantTypeList = await getVariantTypes();
    final variantList = await getVariants(productId);

    List<ProductVariantEntity> productVariantList = [];

    try {
      for (var variantType in variantTypeList) {
        var variants = variantList.where((element) {
          return element.typeId == variantType.id;
        }).toList();
        productVariantList.add(
          ProductVariantEntity(variants, variantType),
        );
      }
      return productVariantList;
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        'An unknown error occurred while loading the variant',
      );
    }
  }

  @override
  Future<CategoryEntity> getProductCategory(
    String categoryId,
  ) async {
    try {
      Map<String, String> queryParam = {
        'filter': 'id="${categoryId}"',
      };

      final response = await _dio.get(
        ApiConstants.categoryEndpoint,
        queryParameters: queryParam,
      );

      final categoryDto = CategoryDto.fromMapJson(
        response.data['items'][0],
      );

      final categoryEntity = CategoryMapper.toDomain(
        categoryDto,
      );
      return categoryEntity;
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      print('Error is: ===> ${ex.toString()}');
      throw ApiException(
        0,
        'An unknown error occurred while loading the variant',
      );
    }
  }

  @override
  Future<List<ProductPropertyEntity>>
  getProductProperties(String productId) async {
    try {
      Map<String, String> queryParam = {
        'filter': 'product_id="${productId}"',
      };
      final response = await _dio.get(
        ApiConstants.productPropertyEndpoint,
        queryParameters: queryParam,
      );

      List<ProductPropertyDto> productPropertyDtoList =
          response.data['items']
              .map<ProductPropertyDto>(
                (jsonMapObject) =>
                    ProductPropertyDto.fromMapJson(
                      jsonMapObject,
                    ),
              )
              .toList();
      List<ProductPropertyEntity> productPropertyList =
          ProductPropertyMapper.toDomainList(
            productPropertyDtoList,
          );

      return productPropertyList;
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        'An unknown error occurred while loading the product properties.',
      );
    }
  }
}
