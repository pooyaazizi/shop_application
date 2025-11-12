import 'package:shop_application/domain/entities/banner_entity.dart';

abstract class IBannerDatasource {
  Future<List<BannerEntity>> getBanners();
}
