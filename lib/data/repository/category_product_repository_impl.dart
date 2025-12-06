import 'package:dartz/dartz.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/error/api_exception.dart';
import 'package:shop_application/data/datasource/category_product_datasource.dart';
import 'package:shop_application/data/repository/category_product_repository.dart';
import 'package:shop_application/domain/entities/product_entity.dart';

class CategoryProductRepositoryImpl
    implements ICategoryProductRepository {
  final ICategoryProductDatasource _datasource =
      locator.get();
  @override
  Future<Either<String, List<ProductEntity>>>
  getProductsByCategory(String categoryId) async {
    try {
      var response = await _datasource
          .getProductsByCategoryId(categoryId);
      return right(response);
    } on ApiException catch (ex) {
      return left(
        ex.message ?? 'خطا محتوای متنی ندارد',
      );
    }
  }
}
