import 'package:dartz/dartz.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/error/api_exception.dart';
import 'package:shop_application/data/datasource/product_datasource.dart';
import 'package:shop_application/data/repository/product_repository.dart';
import 'package:shop_application/domain/entities/product_entity.dart';

class ProductRepositoryImpl
    implements IProductRepository {
  final IProductDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<ProductEntity>>>
  getProducts() async {
    try {
      final response = await _datasource.getProducts();
      return right(response);
    } on ApiException catch (ex) {
      return left(
        ex.message ?? 'خطا محتوای متنی ندارد',
      );
    }
  }
}
