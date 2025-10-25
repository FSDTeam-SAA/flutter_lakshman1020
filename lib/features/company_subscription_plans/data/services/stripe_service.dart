import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../domain/payment_repo.dart';
import '../../domain/usecases/create_payment_intent.dart';

class StripeServices {
  late final PaymentRepository _repository;
  late final CreatePaymentIntent _createPaymentIntent;

  StripeServices() {
    // Get PaymentRepository from DI container
    _repository = Get.find<PaymentRepository>();
    _createPaymentIntent = CreatePaymentIntent(_repository);
  }

  Future<void> makePayment({required String amount, String currency = 'USD'}) async {
    try {
      // amount is passed dynamically from the caller (payment details page)
      final paymentIntent = await _createPaymentIntent.call(amount, currency);

      // Extract and log the Payment Intent ID
      final paymentIntentId = paymentIntent['id'];
      print('🔵 Stripe Payment Intent ID: $paymentIntentId');

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['client_secret'],
          merchantDisplayName: 'Lakshman Merchant',
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      
      // Log the successful transaction ID again
      print('✅ Payment completed successfully! Transaction ID: $paymentIntentId');
      
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
