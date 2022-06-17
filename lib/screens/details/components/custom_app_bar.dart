import 'package:appdatec/components/rounded_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key, required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(
                iconData: Icons.arrow_back_ios,
                press: () => Navigator.pop(context)
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: <Widget> [
                  Text(
                    rating.toString(),
                    style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),
                  ),
                  const SizedBox(width: 5,),
                  SvgPicture.asset("assets/icons/Star Icon.svg",)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
