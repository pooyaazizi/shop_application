import 'package:dio/dio.dart';
import 'package:shop_application/core/constants/api_constants.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/error/api_exception.dart';
import 'package:shop_application/data/datasource/category_datasource.dart';
import 'package:shop_application/data/dto/category_dto.dart';
import 'package:shop_application/data/mapper/category_mapper.dart';
import 'package:shop_application/domain/entities/category_entity.dart';

class CategoryRemoteDatasource
    implements ICategoryDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      var response = await _dio.get(
        ApiConstants.categoryEndpoint,
      );
      List<CategoryDto> categoryDtos = response
          .data['items']
          .map<CategoryDto>(
            (jsonMapObject) =>
                CategoryDto.fromMapJson(jsonMapObject),
          )
          .toList();
      List<CategoryEntity> categoryList =
          CategoryMapper.toDomainList(categoryDtos);
      return categoryList;
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        0,
        'An unknown error occurred while loading the categories',
      );
    }
  }
}
