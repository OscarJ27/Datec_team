import 'package:appdatec/screens/auth/sign_in/sign_in.dart';
import 'package:appdatec/screens/auth/sign_up/sign_up.dart';
import 'package:appdatec/screens/details/details_screen.dart';
import 'package:appdatec/screens/payments/payment.dart';
import 'package:appdatec/screens/principal/home_screen.dart';
import 'package:appdatec/screens/products/celulares/celulares_screen.dart';
import 'package:appdatec/screens/products/celulares/form/cel_form.dart';
import 'package:appdatec/screens/products/celulares/report/report_celular_screen.dart';
import 'package:appdatec/screens/products/computadoras/computadoras_screen.dart';
import 'package:appdatec/screens/products/computadoras/form/com_form.dart';
import 'package:appdatec/screens/products/computadoras/report/report_computadoras_screen.dart';
import 'package:appdatec/screens/products/impresoras/form/im_form.dart';
import 'package:appdatec/screens/products/impresoras/impresoras_screen.dart';
import 'package:appdatec/screens/products/impresoras/report/report_impresoras_screen.dart';
import 'package:appdatec/screens/products/relojes/form/co_form.dart';
import 'package:appdatec/screens/products/relojes/relojes_screen.dart';
import 'package:appdatec/screens/products/relojes/report/report_relojes_screen.dart';
import 'package:appdatec/screens/products/televisores/form/tele_form.dart';
import 'package:appdatec/screens/products/televisores/report/report_televisores_screen.dart';
import 'package:appdatec/screens/products/televisores/televisor_screen.dart';
import 'package:appdatec/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  PaymentScreen.routeName: (context) => const PaymentScreen(),
  ProductoComScreen.routeName: (context) => const ProductoComScreen(),
  ProductFormComScreen.routeName: (context) => const ProductFormComScreen(),
  ReportComScreen.routeName: (context) => const ReportComScreen(),
  ImpresoraForm.routeName: (context) => const ImpresoraForm(),
  ImpresoraReportScreen.routeName:(context) => const ImpresoraReportScreen(),
  ImpresorasComScreen.routeName:(context) => const ImpresorasComScreen(),
  RelojForm.routeName:(context) =>  const RelojForm(),
  RelojReportScreen.routeName:(context) => const RelojReportScreen(),
  RelojesScreen.routeName:(context) => const RelojesScreen(),
  CelularesForm.routeName:(context) => const CelularesForm(),
  CelularesReportScreen.routeName:(context) => const CelularesReportScreen(),
  MovilesCelScreen.routeName:(context) => const MovilesCelScreen(),
  TelevisorScreen.routeName: (context) => const TelevisorScreen(),
  TelevisorFormScreen.routeName: (context) => const TelevisorFormScreen(),
  ReportTeleScreen.routeName: (context) => const ReportTeleScreen(),
};


