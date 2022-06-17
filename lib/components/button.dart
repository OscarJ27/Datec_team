import 'package:appdatec/constant/color.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.text,  required this.press}) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
        ),
        onPressed: press,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
