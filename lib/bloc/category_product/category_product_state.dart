import 'package:dartz/dartz.dart';
import 'package:shop_application/domain/entities/product_entity.dart';

abstract class CategoryProductState {}

class CategoryProductInitializeState
    extends CategoryProductState {}

class CategoryProductLoadingState
    extends CategoryProductState {}

class CategoryProductResponseState
    extends CategoryProductState {
  Either<String, List<ProductEntity>> productList;
  CategoryProductResponseState(this.productList);
}
