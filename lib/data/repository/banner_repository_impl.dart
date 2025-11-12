import 'package:dartz/dartz.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/error/api_exception.dart';
import 'package:shop_application/data/datasource/banner_datasource.dart';
import 'package:shop_application/data/repository/banner_repository.dart';
import 'package:shop_application/domain/entities/banner_entity.dart';

class BannerRepositoryImpl
    implements IBannerRepository {
  final IBannerDatasource bannerDatasource = locator
      .get();
  @override
  Future<Either<String, List<BannerEntity>>>
  getBanners() async {
    try {
      var response = await bannerDatasource
          .getBanners();
      return right(response);
    } on ApiException catch (ex) {
      return left(
        ex.message ?? 'خطا محتوای متنی ندارد',
      );
    }
  }
}
