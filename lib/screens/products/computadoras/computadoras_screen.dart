import 'package:appdatec/models/products/computadoras/productos.dart';
import 'package:appdatec/providers/computadoras_provider.dart';
import 'package:appdatec/screens/drawer/menu_lateral.dart';
import 'package:appdatec/screens/products/computadoras/form/com_form.dart';
import 'package:appdatec/screens/products/computadoras/report/report_computadoras_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';


class ProductoComScreen extends StatefulWidget {
  const ProductoComScreen({Key? key}) : super(key: key);
  static String routeName = "/products";

  @override
  State<ProductoComScreen> createState() => _ProductoComScreenState();
}

class _ProductoComScreenState extends State<ProductoComScreen> {
  @override
  Widget build(BuildContext context) {

    final computoProvider = Provider.of<ComputoProvider>(context);
    final List<Producto> listaProductos = computoProvider.listaProductos.cast<Producto>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Computadoras"),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView.builder(
          itemCount: listaProductos.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: const EdgeInsets.only(top: 30, bottom: 20),
                width: double.infinity,
                height: 300,
                decoration: _cardBorders(),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/images/R.gif'),
                          image: NetworkImage(listaProductos[index].imagen),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(listaProductos[index].descripcion,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                        subtitle: Text('S/. ${listaProductos[index].precio}',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
              ,
            );
          },
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        hoverColor: kPrimaryColor,
        onPressed: (){
          Navigator.pushNamed(context, ProductFormComScreen.routeName);
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
      ),*/
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: Colors.black,
          overlayColor: Colors.black,
          overlayOpacity: 0.4,
          spacing: 12,
          spaceBetweenChildren: 12,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.pie_chart),
              label: 'reporte',
              onTap: () => Navigator.pushNamed(context, ReportComScreen.routeName),
            ),
            SpeedDialChild(
                child: const Icon(Icons.computer),
                label: 'form',
              onTap: () => Navigator.pushNamed(context, ProductFormComScreen.routeName),
            ),
          ],
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 7),
          blurRadius: 10
      )
    ]
);

