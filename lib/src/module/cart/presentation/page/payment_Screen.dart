import 'package:app_flutter_starter_for_job/src/module/cart/presentation/page/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final String htmlContent;

  const PaymentScreen({Key? key, required this.htmlContent}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'FlutterChannel',
        onMessageReceived: (message) {
          if (message.message == "paid") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const PaymentSuccessScreen(),
              ),
            );
          }
        },
      )
      ..loadHtmlString(widget.htmlContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Payment'),
        backgroundColor: Colors.purple.shade600,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
