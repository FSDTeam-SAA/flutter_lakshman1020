import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../domain/usecases/create_payment_intent.dart';
import '../repo/payment_repo_impl.dart';


class StripeServices {
  final _repository = PaymentRepositoryImpl();
  late final CreatePaymentIntent _createPaymentIntent;

  StripeServices() {
    _createPaymentIntent = CreatePaymentIntent(_repository);
  }

  Future<void> makePayment({required String amount, String currency = 'USD'}) async {
    try {
      // amount is passed dynamically from the caller (payment details page)
      final paymentIntent = await _createPaymentIntent.call(amount, currency);

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['client_secret'],
          merchantDisplayName: 'Lakshman Merchant',
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      Fluttertoast.showToast(msg: 'Payment successfully completed');
    } on StripeException catch (e) {
      Fluttertoast.showToast(msg: 'Stripe error: ${e.error.localizedMessage}');
      rethrow;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      rethrow;
    }
  }
}
