import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_application/core/network/dio_client.dart';
import 'package:shop_application/data/datasource/authentication_datasource.dart';
import 'package:shop_application/data/datasource/authentication_remote_datasource_impl.dart';
import 'package:shop_application/data/datasource/category_datasource.dart';
import 'package:shop_application/data/datasource/category_remote_datasource_impl.dart';
import 'package:shop_application/data/repository/authentication_repository.dart';
import 'package:shop_application/data/repository/authentication_repository_impl.dart';
import 'package:shop_application/data/repository/category_repository.dart';
import 'package:shop_application/data/repository/category_repository_impl.dart';

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

  //repository =>
  //authentication:
  locator.registerFactory<IAuthenticationRepository>(
    () => AuthenticationRepositoryImpl(),
  );
  //category:
  locator.registerFactory<ICategoryRepository>(
    () => CategoryRepositoryImpl(),
  );
}
