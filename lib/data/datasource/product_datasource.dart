import 'package:shop_application/domain/entities/product_entity.dart';

abstract class IProductDatasource {
  Future<List<ProductEntity>> getProducts();
}
