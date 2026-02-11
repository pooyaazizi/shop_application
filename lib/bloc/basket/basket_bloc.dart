import 'package:app_links/app_links.dart';
import 'package:bloc/bloc.dart';
import 'package:shop_application/bloc/basket/basket_event.dart';
import 'package:shop_application/bloc/basket/basket_state.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/data/repository/card_item_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

class BasketBloc
    extends Bloc<BasketEvent, BasketState> {
  final ICardItemRepository _cardItemRepository =
      locator.get<ICardItemRepository>();
  PaymentRequest _paymentRequest = PaymentRequest();
  BasketBloc() : super(BasketInitState()) {
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
      _paymentRequest.setIsSandBox(true);
      _paymentRequest.setMerchantID(
        '25bc6210-3d10-46aa-8a27-1058e657a6ad',
      );
      _paymentRequest.setAmount(100000);
      _paymentRequest.setEmail(
        'Pooyaazizi5@gmail.com',
      );
      _paymentRequest.setDescription(
        'this is test for application shop',
      );
      _paymentRequest.setMobile('09100292960');
      _paymentRequest.setCallbackURL(
        'expertflutter://shop',
      );

      AppLinks().uriLinkStream.listen((deeplink) {
        if (deeplink.toString().toLowerCase().contains(
          'authority',
        )) {
          final status =
              deeplink.queryParameters['Status'];
          final authority =
              deeplink.queryParameters['Authority'];

          ZarinPal().verificationPayment(
            status!,
            authority!,
            _paymentRequest,
            (
              isPaymentSuccess,
              refID,
              paymentRequest,
              data,
            ) {
              if (isPaymentSuccess) {
                print('Ref Id: ${refID}');
              }
            },
          );
        }
      });
    });

    on<BasketPaymentRequestEvent>((event, emit) {
      ZarinPal().startPayment(_paymentRequest, (
        status,
        paymentGatewayUri,
        data,
      ) {
        if (status == 100) {
          launchUrl(
            Uri.parse(paymentGatewayUri!),
            mode: LaunchMode.externalApplication,
          );
        }
      });
    });
  }
}
