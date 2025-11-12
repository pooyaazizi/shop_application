import 'package:dartz/dartz.dart';
import 'package:shop_application/domain/entities/banner_entity.dart';

abstract class HomeState {}

class HomeLoadingState implements HomeState {}

class HomeInitiateState implements HomeState {}

class HomeRequestSuccessState implements HomeState {
  Either<String, List<BannerEntity>> bannerList;
  HomeRequestSuccessState(this.bannerList);
}
