import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/data/datasource/card_item_datasource.dart';
import 'package:shop_application/data/dto/local/card_item_dto.dart';
import 'package:shop_application/data/mapper/card_item_mapper.dart';
import 'package:shop_application/domain/entities/card_item_entity.dart';

class CardItemLocalDatasourceImpl
    implements ICardItemDatasource {
  final Box<CardItemDto> cardItemBox = locator.get(
    instanceName: 'cardItemBox',
  );
  @override
  Future<void> addProductToBasket(
    CardItemDto cardItem,
  ) async {
    cardItemBox.add(cardItem);
  }

  @override
  Future<List<CardItemEntity>>
  getALLCardItems() async {
    List<CardItemDto> cardItemDtoList =
        await cardItemBox.values.toList();

    return CardItemMapper.toDomainList(
      cardItemDtoList,
    );
  }
}
