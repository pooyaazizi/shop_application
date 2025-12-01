import 'package:dartz/dartz.dart';
import 'package:shop_application/domain/entities/category_entity.dart';
import 'package:shop_application/domain/entities/product_image_entity.dart';
import 'package:shop_application/domain/entities/product_property_entity.dart';
import 'package:shop_application/domain/entities/product_variant_entity.dart';

abstract class ProductDetailState {}

class ProductDetailInitiatState
    extends ProductDetailState {}

class ProductDetailLoadingState
    extends ProductDetailState {}

class ProductDetailResponseState
    extends ProductDetailState {
  Either<String, List<ProductImageEntity>>
  productImageList;

  Either<String, List<ProductVariantEntity>>
  productVariantList;

  Either<String, CategoryEntity> productCategory;
  Either<String, List<ProductPropertyEntity>>
  productPropertyList;

  ProductDetailResponseState(
    this.productImageList,
    this.productVariantList,
    this.productCategory,
    this.productPropertyList,
  );
}
