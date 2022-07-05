import 'package:appdatec/providers/celulares_provider.dart';
import 'package:appdatec/providers/impresoras_provider.dart';
import 'package:appdatec/providers/metodo_provider.dart';
import 'package:appdatec/providers/relojes_provider.dart';
import 'package:appdatec/providers/televisor_provider.dart';
import 'package:appdatec/screens/splash/splash_animated_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/computadoras_provider.dart';
import 'routes/routes.dart';
import 'theme/theme.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ComputoProvider(), lazy: false,),
        ChangeNotifierProvider(create: (_) => MetodoProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => RelojProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => ImpresoraProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => CelularProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => TelevisorProvider(), lazy: false),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'APP DATEC',
        theme:theme(),
        // home: const SplashScreen(),
        initialRoute: SplashAnimated.routeName,
        routes: routes,
      ),
    );
  }
}





