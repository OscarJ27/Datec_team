import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 238,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset("assets/images/ps4_console_blue_1.png"),
          ),
        ),
      ],
    );
  }
}
