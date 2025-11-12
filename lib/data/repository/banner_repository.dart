import 'package:dartz/dartz.dart';
import 'package:shop_application/domain/entities/banner_entity.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerEntity>>>
  getBanners();
}
