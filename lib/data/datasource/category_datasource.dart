import 'package:shop_application/domain/entities/category_entity.dart';

abstract class ICategoryDatasource {
  Future<List<CategoryEntity>> getCategories();
}
