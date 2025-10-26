import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StripeServices {
  /// Make payment using the client secret from backend
  Future<void> makePaymentWithClientSecret({required String clientSecret}) async {
    try {
      print('🔵 Using Client Secret from backend: $clientSecret');

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Lakshman Merchant',
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      
      // Log the successful payment
      print('✅ Payment completed successfully with client secret!');
      
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
