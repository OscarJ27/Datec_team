import 'package:appdatec/screens/drawer/menu_lateral.dart';
import 'package:appdatec/screens/principal/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Home'),
      ),
      drawer: const MenuLateral(),
      body: const Body(),
    );
  }
}
