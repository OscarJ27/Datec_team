import 'package:appdatec/constant/color.dart';
import 'package:flutter/material.dart';

class Oferta extends StatelessWidget {
  const Oferta({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text.rich(
          TextSpan(
              text: "Una sopresa de otoño\n",
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: "Oferta 15%",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold
                  ),
                )
              ]
          )
      ),
    );
  }
}