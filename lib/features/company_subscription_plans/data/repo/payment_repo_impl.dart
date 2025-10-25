import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/payment_repo.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  @override
  Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async {
    final secretKey = "sk_test_51S9etz6Ly9JyjBRKb2uknbNbOTLmuV46fxkz3nvzg1Q9iC5fggbwdPUqRiydGjRc1ST33GtVwJPMjrh0kY8yVPk200tEuKPZJM";
    if (secretKey.isEmpty) {
      throw Exception('Secret key not available');
    }

    // Clean and parse amount (support decimals like "99.99" and commas)
    final cleaned = amount.replaceAll(RegExp(r'[^0-9\.]'), '').trim();
    final parsed = double.tryParse(cleaned);
    if (parsed == null) {
      throw Exception('Invalid amount format: $amount');
    }
    final amountInCents = (parsed * 100).round().toString();

    final body = {
      'amount': amountInCents,
      'currency': currency,
      'payment_method_types[]': 'card',
    };

    final response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      headers: {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: body,
    );

    final decoded = jsonDecode(response.body.toString());
    if (decoded is! Map<String, dynamic>) {
      throw Exception('Unexpected Stripe response: ${response.body}');
    }

    if (!decoded.containsKey('client_secret')) {
      // include Stripe error message if present
      final err = decoded['error'];
      final msg = err is Map && err.containsKey('message') ? err['message'] : response.body;
      throw Exception('Stripe error creating payment intent: $msg');
    }

  return decoded;
  }
}
