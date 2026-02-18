import 'package:app_links/app_links.dart';
import 'package:shop_application/core/utils/url_handler.dart';
import 'package:zarinpal/zarinpal.dart';

abstract class PaymentHandler {
  Future<void> initPaymentRequest();
  Future<void> sendPaymentrequest();
  Future<void> verifyPaymentRequest();
}

class ZarinpalPaymentHandler
    implements PaymentHandler {
  final PaymentRequest _paymentRequest;
  final UrlHandler _urlHandler;
  String? status;
  String? authority;

  ZarinpalPaymentHandler(
    this._paymentRequest,
    this._urlHandler,
  );
  @override
  Future<void> initPaymentRequest() async {
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setMerchantID(
      '25bc6210-3d10-46aa-8a27-1058e657a6ad',
    );
    _paymentRequest.setAmount(100000);
    _paymentRequest.setEmail('Pooyaazizi5@gmail.com');
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
        status = deeplink.queryParameters['Status'];
        authority =
            deeplink.queryParameters['Authority'];
        verifyPaymentRequest();
      }
    });
  }

  @override
  Future<void> sendPaymentrequest() async {
    ZarinPal().startPayment(_paymentRequest, (
      status,
      paymentGatewayUri,
      data,
    ) {
      if (status == 100) {
        _urlHandler.openUrl(paymentGatewayUri!);
      }
    });
  }

  @override
  Future<void> verifyPaymentRequest() async {
    ZarinPal().verificationPayment(
      status!,
      authority!,
      _paymentRequest,
      (isPaymentSuccess, refID, paymentRequest, data) {
        if (isPaymentSuccess) {
          print('Ref Id: ${refID}');
        }
      },
    );
  }
}
