import 'package:dartz/dartz.dart';
import 'package:shop_application/domain/entities/category_entity.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<CategoryEntity>>>
  getCategories();
}
