import 'package:appdatec/screens/principal/components/popular_products.dart';
import 'package:appdatec/screens/principal/components/special_offers.dart';
import 'package:flutter/material.dart';
import 'banner.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
             SizedBox(height: 30,),
             Oferta(),
             SizedBox(height: 30,),
             SpecilaOffers(),
             SizedBox(height: 30,),
             PopularProducts(),
             SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}














