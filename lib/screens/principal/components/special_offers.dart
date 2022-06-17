import 'package:appdatec/screens/principal/components/section_title.dart';
import 'package:flutter/material.dart';

class SpecilaOffers extends StatelessWidget {
  const SpecilaOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Especial para ti",
          press: () {},
        ),
        const SizedBox(height: 20,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialCard(
                image: "assets/images/celular.jpg",
                category: "Celulares",
                numOfBrands: 3,
                press: (){},
              ),
              SpecialCard(
                image: "assets/images/pc.jpg",
                category: "Computadoras",
                numOfBrands: 3,
                press: (){},
              ),
              SpecialCard(
                image: "assets/images/camara.jpg",
                category: "Camaras",
                numOfBrands: 3,
                press: (){},
              ),
              SpecialCard(
                image: "assets/images/reloj.jpg",
                category: "Relojes",
                numOfBrands: 3,
                press: (){},
              ),
              SpecialCard(
                image: "assets/images/tv.jpg",
                category: "Televisores",
                numOfBrands: 3,
                press: (){},
              ),
              const SizedBox(width: 20,)
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialCard extends StatelessWidget {
  const SpecialCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: 242,
        height: 100,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [ Image.asset(
                image,
                fit: BoxFit.cover,),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF343434).withOpacity(0.4),
                          const Color(0xFF343434).withOpacity(0.15)
                        ],
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text.rich(
                      TextSpan(
                          style: const TextStyle(color: Colors.white),
                          children: [
                            TextSpan(text: "$category\n",style: const TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold,

                            ),
                            ),
                            TextSpan(text: "$numOfBrands marcas"),
                          ]
                      )
                  ),
                )
              ],
            )),
      ),
    );
  }
}
