import 'package:shop_application/domain/entities/category_entity.dart';
import 'package:shop_application/domain/entities/product_image_entity.dart';
import 'package:shop_application/domain/entities/product_property_entity.dart';
import 'package:shop_application/domain/entities/product_variant_entity.dart';
import 'package:shop_application/domain/entities/variant_entity.dart';
import 'package:shop_application/domain/entities/variant_type_entity.dart';

abstract class IProductDetailDatasource {
  Future<List<ProductImageEntity>> getGallery(
    String productId,
  );
  Future<List<VariantEntity>> getVariants(
    String productId,
  );
  Future<List<VariantTypeEntity>> getVariantTypes();
  Future<List<ProductVariantEntity>>
  getProductVariants(String productId);

  Future<CategoryEntity> getProductCategory(
    String categoryId,
  );

  Future<List<ProductPropertyEntity>>
  getProductProperties(String productId);
}
