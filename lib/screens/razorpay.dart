import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayScreen extends StatefulWidget {
  const RazorPayScreen({Key? key}) : super(key: key);

  @override
  State<RazorPayScreen> createState() => _RazorPayScreenState();
}

class _RazorPayScreenState extends State<RazorPayScreen> {
  Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    debugPrint(
        'res ${response.signature} ${response.orderId} ${response.paymentId}');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet selection
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_ax5R0HtxrLmVyD',
      // 'amount':300*100,
      'order_id': 'order_LwelVAr0pJ5zuC',
      'name': 'Example App',
      'description': 'Test Payment',
      'prefill': {
        'contact': 9876543210,
        'email': 'sav@gmail.com',
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            openCheckout();
          },
          child: const Text('Pay Now'),
        ),
      ),
    );
  }
}
