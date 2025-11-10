import 'package:dartz/dartz.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/error/api_exception.dart';
import 'package:shop_application/data/datasource/category_datasource.dart';
import 'package:shop_application/data/repository/category_repository.dart';
import 'package:shop_application/domain/entities/category_entity.dart';

class CategoryRepositoryImpl
    implements ICategoryRepository {
  final ICategoryDatasource _datasource = locator
      .get();
  @override
  Future<Either<String, List<CategoryEntity>>>
  getCategories() async {
    try {
      var response = await _datasource.getCategories();
      return right(response);
    } on ApiException catch (ex) {
      return left(
        ex.message ?? 'خطا محتوای متنی ندارد',
      );
    }
  }
}
