import 'package:dartz/dartz.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/error/api_exception.dart';
import 'package:shop_application/data/datasource/product_detail_datasource.dart';
import 'package:shop_application/data/repository/product_detail_repository.dart';
import 'package:shop_application/domain/entities/category_entity.dart';
import 'package:shop_application/domain/entities/product_image_entity.dart';
import 'package:shop_application/domain/entities/product_property_entity.dart';
import 'package:shop_application/domain/entities/product_variant_entity.dart';

class ProductDetailRepositoryImpl
    implements IProductDetailRepository {
  final IProductDetailDatasource _datasource = locator
      .get();
  @override
  Future<Either<String, List<ProductImageEntity>>>
  getGallery(String productId) async {
    try {
      final response = await _datasource.getGallery(
        productId,
      );
      return right(response);
    } on ApiException catch (ex) {
      return left(
        ex.message ?? 'خطا محتوای متنی ندارد',
      );
    }
  }

  @override
  Future<Either<String, List<ProductVariantEntity>>>
  getProductVariants(String productId) async {
    try {
      final response = await _datasource
          .getProductVariants(productId);
      return right(response);
    } on ApiException catch (ex) {
      return left(
        ex.message ?? 'خطا محتوای متنی ندارد',
      );
    }
  }

  @override
  Future<Either<String, CategoryEntity>>
  getProductCategory(String categoryId) async {
    try {
      final response = await _datasource
          .getProductCategory(categoryId);
      return right(response);
    } on ApiException catch (ex) {
      return left(
        ex.message ?? 'خطا محتوای متنی ندارد',
      );
    }
  }

  @override
  Future<Either<String, List<ProductPropertyEntity>>>
  getProductProperties(String productId) async {
    try {
      final response = await _datasource
          .getProductProperties(productId);
      return right(response);
    } on ApiException catch (ex) {
      return left(
        ex.message ?? 'خطا محتوای متنی ندارد',
      );
    }
  }
}
