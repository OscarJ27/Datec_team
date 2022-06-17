import 'package:appdatec/components/product_card.dart';
import 'package:appdatec/models/Product.dart';
import 'package:appdatec/screens/details/details_screen.dart';
import 'package:appdatec/screens/principal/components/section_title.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(text: "Productos Populares",
            press: () {}
        ),
        const SizedBox(height: 20,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
                ...List.generate(demoProducts.length,
                  (index){
                      if(demoProducts[index].isPopular) {
                        return ProductCard(
                            product: demoProducts[index],
                            press: () => Navigator.pushNamed(context,
                              DetailsScreen.routeName,
                              arguments: ProductDetailsArguments(
                                  product: demoProducts[index]),
                            )
                        );
                      }
                      return const SizedBox.shrink();
                  },
                  ),
              const SizedBox(width: 20,)
            ],
          ),
        ),
      ],
    );
  }
}
