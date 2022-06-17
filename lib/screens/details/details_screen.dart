import 'package:appdatec/models/Product.dart';
import 'package:appdatec/screens/details/components/body.dart';
import 'package:appdatec/screens/details/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // By default our background color is white
      backgroundColor: Color(0xFFF5F6F9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: CustomAppBar(rating: 4.5,),
        ),
      body: Body(),
      //body: Body(product: arguments.product,),
    );
  }
}

class ProductDetailsArguments{
  final Product product;
  ProductDetailsArguments({required this.product});
}
