import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/bloc/home/home_event.dart';
import 'package:shop_application/bloc/home/home_state.dart';
import 'package:shop_application/data/repository/banner_repository.dart';
import 'package:shop_application/data/repository/category_repository.dart';
import 'package:shop_application/data/repository/product_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository;
  final ICategoryRepository _categoryRepository;
  final IProductRepository _productRepository;

  HomeBloc(
    this._bannerRepository,
    this._categoryRepository,
    this._productRepository,
  ) : super(HomeInitiateState()) {
    on<HomeInitializeEvent>((event, emit) async {
      emit(HomeLoadingState());

      final bannerResponse = await _bannerRepository
          .getBanners();
      final categoryResponse =
          await _categoryRepository.getCategories();
      final productResponse = await _productRepository
          .getProducts();

      final bestSellerProductResponse =
          await _productRepository
              .getBestSellerProducts();

      final hotestProductResponse =
          await _productRepository
              .getHottestProducts();

      emit(
        HomeRequestSuccessState(
          bannerResponse,
          categoryResponse,
          productResponse,
          bestSellerProductResponse,
          hotestProductResponse,
        ),
      );
    });
  }
}
