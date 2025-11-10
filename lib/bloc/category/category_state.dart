import 'package:dartz/dartz.dart';
import 'package:shop_application/domain/entities/category_entity.dart';

abstract class CategoryState {}

class CategoryInitiateState implements CategoryState {}

class CategoryLoadingState implements CategoryState {}

class CategoryResponseState implements CategoryState {
  Either<String, List<CategoryEntity>> response;
  CategoryResponseState(this.response);
}
