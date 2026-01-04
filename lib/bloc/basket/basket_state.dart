import 'package:dartz/dartz.dart';
import 'package:shop_application/domain/entities/card_item_entity.dart';

abstract class BasketState {}

class BasketInitState extends BasketState {}

class BasketLoadingState extends BasketState {}

class BasketDataFeachedState extends BasketState {
  Either<String, List<CardItemEntity>> cardItemList;

  BasketDataFeachedState(this.cardItemList);
}
