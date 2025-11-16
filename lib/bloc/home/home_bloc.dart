import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/bloc/home/home_event.dart';
import 'package:shop_application/bloc/home/home_state.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/data/repository/banner_repository.dart';
import 'package:shop_application/data/repository/category_repository.dart';
import 'package:shop_application/data/repository/product_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository bannerRepository = locator
      .get();
  final ICategoryRepository categoryRepository =
      locator.get();
  final IProductRepository productRepository = locator
      .get();

  HomeBloc() : super(HomeInitiateState()) {
    on<HomeInitializeEvent>((event, emit) async {
      emit(HomeLoadingState());

      final bannerResponse = await bannerRepository
          .getBanners();
      final categoryResponse = await categoryRepository
          .getCategories();
      final productResponse = await productRepository
          .getProducts();

      emit(
        HomeRequestSuccessState(
          bannerResponse,
          categoryResponse,
          productResponse,
        ),
      );
    });
  }
}
