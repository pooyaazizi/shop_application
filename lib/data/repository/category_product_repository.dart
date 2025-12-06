import 'package:dartz/dartz.dart';
import 'package:shop_application/domain/entities/product_entity.dart';

abstract class ICategoryProductRepository {
  Future<Either<String, List<ProductEntity>>>
  getProductsByCategory(String categoryId);
}
