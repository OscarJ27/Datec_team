import 'package:appdatec/screens/payments/components/body.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static String routeName = "/payments";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Método de pago',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Body(),
    );
  }
}
