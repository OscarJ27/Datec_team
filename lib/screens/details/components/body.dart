import 'package:appdatec/components/button.dart';
import 'package:appdatec/constant/color.dart';
import 'package:appdatec/screens/details/components/product_images.dart';
import 'package:appdatec/screens/payments/payment.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key,}
      ) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProductImages(),
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(top: 20),
          width: double.infinity,
          height: 250,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Mando PS4",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(height: 20,),
              const Padding(
                  padding: EdgeInsets.only(
                   left: 20,
                    right: 20,
                  ),
              child: Text(
                "Accesorio para ps4 de ultima generación con funciones inoovadoras"
              ),
              ),
               Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: const <Widget>[
                       Text(
                        "Ver más",
                        style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600,
                        ),
                      ),
                       SizedBox(height: 5,),
                       Icon(Icons.arrow_forward_ios,
                        size: 12, color: kPrimaryColor,
                      ),
                        ],
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Button(text: "Comprar", press: (){
                  Navigator.pushNamed(context, PaymentScreen.routeName);
                }),
              )
            ],
          ),
        )
      ],
    );
  }
}

