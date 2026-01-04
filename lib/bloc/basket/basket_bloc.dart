import 'package:bloc/bloc.dart';
import 'package:shop_application/bloc/basket/basket_event.dart';
import 'package:shop_application/bloc/basket/basket_state.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/data/repository/card_item_repository.dart';

class BasketBloc
    extends Bloc<BasketEvent, BasketState> {
  final ICardItemRepository _cardItemRepository =
      locator.get<ICardItemRepository>();
  BasketBloc() : super(BasketInitState()) {
    on<BasketFetchFromHiveEvent>((event, emit) async {
      final cardItemList = await _cardItemRepository
          .getAllCardItems();

      emit(BasketDataFeachedState(cardItemList));
    });
  }
}
