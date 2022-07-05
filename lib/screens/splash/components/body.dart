import 'package:appdatec/components/button.dart';
import 'package:appdatec/constant/color.dart';
import 'package:appdatec/screens/auth/sign_in/sign_in.dart';

import 'package:flutter/material.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                const Spacer(),
                const Text("DATEC", style: TextStyle(fontSize: 40,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                ),),
                const Text("Bienvenido a Datec, Vamos a la tienda"),
                const Spacer(flex: 2,),
                Image.asset(
                  "assets/images/datec2.png",
                  height: 265,
                  width: 235,
                )
              ],
            ),
          ),
             Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                       const Spacer(flex: 1,),
                    Button(text: "Continue", press: (){
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
