import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CheckoutPage extends StatelessWidget {
  static const String route = '/checkout';

  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Container(),
    );
  }
}
