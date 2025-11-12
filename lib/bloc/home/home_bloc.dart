import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/bloc/home/home_event.dart';
import 'package:shop_application/bloc/home/home_state.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/data/repository/banner_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository bannerRepository = locator
      .get();
  HomeBloc() : super(HomeInitiateState()) {
    on<HomeInitializeEvent>((event, emit) async {
      emit(HomeLoadingState());

      final response = await bannerRepository
          .getBanners();

      emit(HomeRequestSuccessState(response));
    });
  }
}
