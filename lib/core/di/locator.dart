import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_application/core/network/dio_client.dart';
import 'package:shop_application/data/datasource/authentication_datasource.dart';
import 'package:shop_application/data/datasource/authentication_remote_datasource_impl.dart';
import 'package:shop_application/data/datasource/banner_datasource.dart';
import 'package:shop_application/data/datasource/banner_remote_datasource_impl.dart';
import 'package:shop_application/data/datasource/category_datasource.dart';
import 'package:shop_application/data/datasource/category_product_datasource.dart';
import 'package:shop_application/data/datasource/category_product_datasource_impl.dart';
import 'package:shop_application/data/datasource/category_remote_datasource_impl.dart';
import 'package:shop_application/data/datasource/product_datasource.dart';
import 'package:shop_application/data/datasource/product_detail_datasource.dart';
import 'package:shop_application/data/datasource/product_detail_remote_datasource_impl.dart';
import 'package:shop_application/data/datasource/product_property_datasourse.dart';
import 'package:shop_application/data/datasource/product_remote_datasource_impl.dart';
import 'package:shop_application/data/repository/authentication_repository.dart';
import 'package:shop_application/data/repository/authentication_repository_impl.dart';
import 'package:shop_application/data/repository/banner_repository.dart';
import 'package:shop_application/data/repository/banner_repository_impl.dart';
import 'package:shop_application/data/repository/category_product_repository.dart';
import 'package:shop_application/data/repository/category_product_repository_impl.dart';
import 'package:shop_application/data/repository/category_repository.dart';
import 'package:shop_application/data/repository/category_repository_impl.dart';
import 'package:shop_application/data/repository/product_detail_repository.dart';
import 'package:shop_application/data/repository/product_detail_repository_impl.dart';
import 'package:shop_application/data/repository/product_repository.dart';
import 'package:shop_application/data/repository/product_repository_impl.dart';

var locator = GetIt.instance;

Future<void> setupLocator() async {
  //components
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  //dio client
  locator.registerLazySingleton<Dio>(
    () => DioClient.instance,
  );

  //datasource =>
  //authentication:
  locator.registerFactory<IAuthenticationDatasource>(
    () => AuthenticationRemoteDatasourceImpl(),
  );
  //category:
  locator.registerFactory<ICategoryDatasource>(
    () => CategoryRemoteDatasource(),
  );
  //banner:
  locator.registerFactory<IBannerDatasource>(
    () => BannerRemoteDatasourceImpl(),
  );
  //product:
  locator.registerFactory<IProductDatasource>(
    () => ProductRemoteDatasourceImpl(),
  );
  //product detail:
  locator.registerFactory<IProductDetailDatasource>(
    () => ProductDetailRemoteDatasourceImpl(),
  );
  //category product:
  locator.registerFactory<ICategoryProductDatasource>(
    () => CategoryProductDatasourceImpl(),
  );

  //repository =>
  //authentication:
  locator.registerFactory<IAuthenticationRepository>(
    () => AuthenticationRepositoryImpl(),
  );
  //category:
  locator.registerFactory<ICategoryRepository>(
    () => CategoryRepositoryImpl(),
  );
  //banner:
  locator.registerFactory<IBannerRepository>(
    () => BannerRepositoryImpl(),
  );
  //product:
  locator.registerFactory<IProductRepository>(
    () => ProductRepositoryImpl(),
  );
  //product detail:
  locator.registerFactory<IProductDetailRepository>(
    () => ProductDetailRepositoryImpl(),
  );
  //product detail:
  locator.registerFactory<ICategoryProductRepository>(
    () => CategoryProductRepositoryImpl(),
  );
}
