import 'package:shop_application/domain/entities/product_entity.dart';

abstract class ICategoryProductDatasource {
  Future<List<ProductEntity>> getProductsByCategoryId(
    String categoryId,
  );
}
