import 'package:dartz/dartz.dart';
import 'package:shop_application/data/dto/local/card_item_dto.dart';
import 'package:shop_application/domain/entities/card_item_entity.dart';

abstract class ICardItemRepository {
  Future<Either<String, String>> addProductToBasket(
    CardItemDto cardItemDto,
  );

  Future<Either<String, List<CardItemEntity>>>
  getAllCardItems();
}
