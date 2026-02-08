import 'package:shop_application/data/dto/local/card_item_dto.dart';
import 'package:shop_application/domain/entities/card_item_entity.dart';
import 'package:shop_application/domain/entities/product_entity.dart';

abstract class ICardItemDatasource {
  Future<void> addProductToBasket(
    CardItemDto cardItemDto,
  );
  Future<List<CardItemEntity>> getALLCardItems();

  Future<int> getBasketFinalPrice();
}
