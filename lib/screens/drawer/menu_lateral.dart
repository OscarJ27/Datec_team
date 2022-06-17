import 'package:appdatec/constant/color.dart';
import 'package:appdatec/screens/auth/sign_in/sign_in.dart';
import 'package:appdatec/screens/principal/home_screen.dart';
import 'package:appdatec/screens/products/celulares/celulares_screen.dart';
import 'package:appdatec/screens/products/computadoras/computadoras_screen.dart';
import 'package:appdatec/screens/products/impresoras/impresoras_screen.dart';
import 'package:appdatec/screens/products/relojes/relojes_screen.dart';
import 'package:appdatec/screens/products/televisores/televisor_screen.dart';

import 'package:flutter/material.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
            const UserAccountsDrawerHeader(
            accountName: Text("Admin@gmail.com"),
            accountEmail: Text("Admin"),
             decoration: BoxDecoration(
               color: kPrimaryColor
             ),
             currentAccountPicture: CircleAvatar(
               child: Text("AB"),
             ),
           ),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: (){
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Computadoras'),
            leading: const Icon(Icons.computer),
            onTap: (){
              Navigator.pushReplacementNamed(context, ProductoComScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Celulares'),
            leading: const Icon(Icons.phone_android),
            onTap: (){
              Navigator.pushReplacementNamed(context, MovilesCelScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Relojes'),
            leading: const Icon(Icons.watch),
            onTap: (){
              Navigator.pushReplacementNamed(context, RelojesScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Televisores'),
            leading: const Icon(Icons.tv),
            onTap: (){
              Navigator.pushReplacementNamed(context, TelevisorScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Impresoras'),
            leading: const Icon(Icons.scanner),
            onTap: (){
              Navigator.pushReplacementNamed(context, ImpresorasComScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings),
            onTap: (){
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Cerrar Sesión'),
            onTap: (){
              Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}

