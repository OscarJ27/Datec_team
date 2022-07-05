import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:appdatec/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashAnimated extends StatelessWidget {
  const SplashAnimated({Key? key}) : super(key: key);
  static String routeName = "/splashanimated";

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.network("https://assets9.lottiefiles.com/private_files/lf30_o49tbcab.json",),
      /*
      splash:Column(
          children: [
            Image.asset("assets/images/splash.png"),
            const Text("Datec app", style:
            TextStyle(fontSize: 20, color: Colors.black),)
          ],
        ),
        */
      backgroundColor: Colors.white,
      duration: 3000,
      splashIconSize: 250,
      nextScreen: const SplashScreen(),
      pageTransitionType: PageTransitionType.bottomToTop
    );
  }
}