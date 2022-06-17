import 'package:flutter/material.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    // Tienes que llamarlo en tu pantalla de inicio.
    return const Scaffold(
      body: Body(),
    );
  }
}
