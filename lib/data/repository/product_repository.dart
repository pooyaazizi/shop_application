import 'package:dartz/dartz.dart';
import 'package:shop_application/domain/entities/product_entity.dart';

abstract class IProductRepository {
  Future<Either<String, List<ProductEntity>>>
  getProducts();
}
