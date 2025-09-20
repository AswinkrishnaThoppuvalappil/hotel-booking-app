import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay;
  String paymentStatus = "Not started";

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();

    // Event listeners
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    setState(() {
      paymentStatus = "Payment Successful! ID: ${response.paymentId}";
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    setState(() {
      paymentStatus =
          "Payment Failed! Code: ${response.code}, Message: ${response.message}";
    });
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    setState(() {
      paymentStatus = "External Wallet Selected: ${response.walletName}";
    });
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 10000,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      setState(() {
        paymentStatus = "Error opening Razorpay: $e";
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear(); // Removes all listeners
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Razorpay Payment")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: openCheckout,
              child: const Text("Pay Now"),
            ),
            const SizedBox(height: 20),
            Text(paymentStatus, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
