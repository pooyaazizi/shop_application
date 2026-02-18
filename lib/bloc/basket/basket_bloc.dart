import 'package:bloc/bloc.dart';
import 'package:shop_application/bloc/basket/basket_event.dart';
import 'package:shop_application/bloc/basket/basket_state.dart';
import 'package:shop_application/core/utils/payment_handler.dart';

import 'package:shop_application/data/repository/card_item_repository.dart';

class BasketBloc
    extends Bloc<BasketEvent, BasketState> {
  final ICardItemRepository _cardItemRepository;
  final PaymentHandler _paymentHandler;

  BasketBloc(
    this._cardItemRepository,
    this._paymentHandler,
  ) : super(BasketInitState()) {
    on<BasketFetchFromHiveEvent>((event, emit) async {
      final cardItemList = await _cardItemRepository
          .getAllCardItems();
      final finalPrice = await _cardItemRepository
          .getBasketFinalPrice();
      emit(
        BasketDataFeachedState(
          cardItemList,
          finalPrice,
        ),
      );
    });

    on<BasketPaymentInitEvent>((event, emit) {
      _paymentHandler.initPaymentRequest();
    });

    on<BasketPaymentRequestEvent>((event, emit) {
      _paymentHandler.sendPaymentrequest();
    });
  }
}
