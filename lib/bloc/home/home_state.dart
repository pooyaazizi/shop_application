import 'package:dartz/dartz.dart';
import 'package:shop_application/domain/entities/banner_entity.dart';
import 'package:shop_application/domain/entities/category_entity.dart';
import 'package:shop_application/domain/entities/product_entity.dart';

abstract class HomeState {}

class HomeLoadingState implements HomeState {}

class HomeInitiateState implements HomeState {}

class HomeRequestSuccessState implements HomeState {
  Either<String, List<BannerEntity>> bannerList;
  Either<String, List<CategoryEntity>> categoryList;
  Either<String, List<ProductEntity>> productList;
  HomeRequestSuccessState(
    this.bannerList,
    this.categoryList,
    this.productList,
  );
}
