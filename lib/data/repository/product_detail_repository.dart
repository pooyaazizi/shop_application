import 'package:dartz/dartz.dart';
import 'package:shop_application/domain/entities/category_entity.dart';
import 'package:shop_application/domain/entities/product_image_entity.dart';
import 'package:shop_application/domain/entities/product_property_entity.dart';
import 'package:shop_application/domain/entities/product_variant_entity.dart';

abstract class IProductDetailRepository {
  Future<Either<String, List<ProductImageEntity>>>
  getGallery(String productId);

  Future<Either<String, List<ProductVariantEntity>>>
  getProductVariants(String productId);
  Future<Either<String, CategoryEntity>>
  getProductCategory(String categoryId);
  Future<Either<String, List<ProductPropertyEntity>>>
  getProductProperties(String productId);
}
