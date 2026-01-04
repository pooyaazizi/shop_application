import 'package:hive_flutter/hive_flutter.dart';
part 'card_item_dto.g.dart';

@HiveType(typeId: 0)
class CardItemDto {
  @HiveField(0)
  String productId;
  @HiveField(1)
  String collectionId;
  @HiveField(2)
  String thumbnail;
  @HiveField(3)
  int discountPrice;
  @HiveField(4)
  int price;
  @HiveField(5)
  String name;
  @HiveField(6)
  String category;
  @HiveField(7)
  int realPrice;
  @HiveField(8)
  double discountPercent;

  CardItemDto(
    this.productId,
    this.collectionId,
    this.thumbnail,
    this.discountPrice,
    this.price,
    this.name,
    this.category,
    this.realPrice,
    this.discountPercent,
  );
}
