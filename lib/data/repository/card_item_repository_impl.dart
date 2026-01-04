import 'package:dartz/dartz.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/data/datasource/card_item_datasource.dart';
import 'package:shop_application/data/dto/local/card_item_dto.dart';
import 'package:shop_application/data/repository/card_item_repository.dart';
import 'package:shop_application/domain/entities/card_item_entity.dart';

class CardItemRepositoryImpl
    implements ICardItemRepository {
  final ICardItemDatasource _datasource = locator
      .get();

  @override
  Future<Either<String, String>> addProductToBasket(
    CardItemDto cardItemDto,
  ) async {
    try {
      await _datasource.addProductToBasket(
        cardItemDto,
      );
      return right(
        '${cardItemDto.name} با موفقیت به سبد خرید اضافه شد.',
      );
    } catch (ex) {
      return left(
        'خطا در افزودن ${cardItemDto.name} به سبد خرید',
      );
    }
  }

  @override
  Future<Either<String, List<CardItemEntity>>>
  getAllCardItems() async {
    try {
      var cardItemList = await _datasource
          .getALLCardItems();
      return right(cardItemList);
    } catch (ex) {
      return left('خطا در نمایش محصولات');
    }
  }
}
