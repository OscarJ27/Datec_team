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
               backgroundImage: AssetImage("assets/images/admin.png"),
             ),
           ),
          ListTile(
            title: const Text('Home', style: TextStyle(color: Colors.black),),
            leading: const Icon(Icons.home, color: Colors.black,),
            onTap: (){
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Computer',style: TextStyle(color: Colors.black),),
            leading: const Icon(Icons.computer, color: Colors.black,),
            onTap: (){
              Navigator.pushReplacementNamed(context, ProductoComScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Phone', style: TextStyle(color: Colors.black),),
            leading: const Icon(Icons.phone_android, color: Colors.black,),
            onTap: (){
              Navigator.pushReplacementNamed(context, MovilesCelScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Smart Watch', style: TextStyle(color: Colors.black)),
            leading: const Icon(Icons.watch, color: Colors.black,),
            onTap: (){
              Navigator.pushReplacementNamed(context, RelojesScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('TV', style: TextStyle(color: Colors.black),),
            leading: const Icon(Icons.tv, color: Colors.black,),
            onTap: (){
              Navigator.pushReplacementNamed(context, TelevisorScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Printer', style: TextStyle(color: Colors.black),),
            leading: const Icon(Icons.scanner, color: Colors.black,),
            onTap: (){
              Navigator.pushReplacementNamed(context, ImpresorasComScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Settings', style: TextStyle(color: Colors.black),),
            leading: const Icon(Icons.settings, color: Colors.black,),
            onTap: (){
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Log out', style: TextStyle(color: Colors.black),),
            leading: const Icon(Icons.logout_outlined, color: Colors.black,),
            onTap: (){
              Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}

