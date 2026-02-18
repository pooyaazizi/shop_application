import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_application/bloc/authentication/auth_bloc.dart';
import 'package:shop_application/bloc/basket/basket_bloc.dart';
import 'package:shop_application/bloc/category/category_bloc.dart';
import 'package:shop_application/bloc/category_product/category_product_bloc.dart';
import 'package:shop_application/bloc/home/home_bloc.dart';
import 'package:shop_application/bloc/product/product_detail_bloc.dart';
import 'package:shop_application/core/network/dio_client.dart';
import 'package:shop_application/core/utils/payment_handler.dart';
import 'package:shop_application/core/utils/url_handler.dart';
import 'package:shop_application/data/datasource/authentication_datasource.dart';
import 'package:shop_application/data/datasource/authentication_remote_datasource_impl.dart';
import 'package:shop_application/data/datasource/banner_datasource.dart';
import 'package:shop_application/data/datasource/banner_remote_datasource_impl.dart';
import 'package:shop_application/data/datasource/card_item_datasource.dart';
import 'package:shop_application/data/datasource/card_item_local_datasource_impl.dart';
import 'package:shop_application/data/datasource/category_datasource.dart';
import 'package:shop_application/data/datasource/category_product_datasource.dart';
import 'package:shop_application/data/datasource/category_product_datasource_impl.dart';
import 'package:shop_application/data/datasource/category_remote_datasource_impl.dart';
import 'package:shop_application/data/datasource/product_datasource.dart';
import 'package:shop_application/data/datasource/product_detail_datasource.dart';
import 'package:shop_application/data/datasource/product_detail_remote_datasource_impl.dart';
import 'package:shop_application/data/datasource/product_remote_datasource_impl.dart';
import 'package:shop_application/data/dto/local/card_item_dto.dart';
import 'package:shop_application/data/repository/authentication_repository.dart';
import 'package:shop_application/data/repository/authentication_repository_impl.dart';
import 'package:shop_application/data/repository/banner_repository.dart';
import 'package:shop_application/data/repository/banner_repository_impl.dart';
import 'package:shop_application/data/repository/card_item_repository.dart';
import 'package:shop_application/data/repository/card_item_repository_impl.dart';
import 'package:shop_application/data/repository/category_product_repository.dart';
import 'package:shop_application/data/repository/category_product_repository_impl.dart';
import 'package:shop_application/data/repository/category_repository.dart';
import 'package:shop_application/data/repository/category_repository_impl.dart';
import 'package:shop_application/data/repository/product_detail_repository.dart';
import 'package:shop_application/data/repository/product_detail_repository_impl.dart';
import 'package:shop_application/data/repository/product_repository.dart';
import 'package:shop_application/data/repository/product_repository_impl.dart';
import 'package:zarinpal/zarinpal.dart';

var locator = GetIt.instance;

Future<void> setupLocator() async {
  await initHiveDatabase();
  await initComponents();
  initDio();
  initDatasources();
  initRepositories();
  initBlocs();
}

Future<void> initHiveDatabase() async {
  //Hive
  await Hive.initFlutter();
  Hive.registerAdapter<CardItemDto>(
    CardItemDtoAdapter(),
  );
  final cardItemBox = await Hive.openBox<CardItemDto>(
    'CardItemBox',
  );

  locator.registerSingleton<Box<CardItemDto>>(
    cardItemBox,
    instanceName: 'cardItemBox',
  );
}

Future<void> initComponents() async {
  //utils
  locator.registerSingleton<PaymentRequest>(
    PaymentRequest(),
  );
  locator.registerSingleton<UrlHandler>(UrlLauncher());
  locator.registerSingleton<PaymentHandler>(
    ZarinpalPaymentHandler(
      locator.get(),
      locator.get(),
    ),
  );

  //components
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
}

void initDio() {
  //dio client
  locator.registerLazySingleton<Dio>(
    () => DioClient.instance,
  );
}

void initDatasources() {
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
  //card item:
  locator.registerFactory<ICardItemDatasource>(
    () => CardItemLocalDatasourceImpl(),
  );
}

void initRepositories() {
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
  //card item:
  locator.registerFactory<ICardItemRepository>(
    () => CardItemRepositoryImpl(),
  );
}

void initBlocs() {
  //bloc=>
  //authentication bloc
  locator.registerSingleton<AuthBloc>(
    AuthBloc(locator.get()),
  );
  //basket bloc
  locator.registerSingleton<BasketBloc>(
    BasketBloc(locator.get(), locator.get()),
  );
  //category bloc
  locator.registerSingleton<CategoryBloc>(
    CategoryBloc(locator.get()),
  );
  //category product bloc
  locator.registerSingleton<CategoryProductBloc>(
    CategoryProductBloc(locator.get()),
  );
  //home bloc
  locator.registerSingleton<HomeBloc>(
    HomeBloc(
      locator.get(),
      locator.get(),
      locator.get(),
    ),
  );
  //product detail bloc
  locator.registerSingleton<ProductDetailBloc>(
    ProductDetailBloc(locator.get(), locator.get()),
  );
}
