abstract class PaymentRepository {
  /// Create a PaymentIntent and return the decoded JSON response as a Map.
  Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency);
}
