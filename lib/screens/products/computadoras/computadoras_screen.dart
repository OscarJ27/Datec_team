import 'package:appdatec/models/products/computadoras/productos.dart';
import 'package:appdatec/providers/computadoras_provider.dart';
import 'package:appdatec/screens/drawer/menu_lateral.dart';
import 'package:appdatec/screens/products/computadoras/form/com_form.dart';
import 'package:appdatec/screens/products/computadoras/report/report_computadoras_screen.dart';
import 'package:appdatec/search/computer_search_delegate.dart';
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
    final List<Producto> listaProductos = computoProvider.listaProductos;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Computer", style: TextStyle(color: Colors.black),),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: ProductoSearchDelegate(listaProductos));},
                icon: const Icon(Icons.search)
            )
          ],
        ),
        drawer: const MenuLateral(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 3 / 2,
                  maxCrossAxisExtent: 300,
                  mainAxisExtent: 300,
              ),
              itemCount: listaProductos.length,
              itemBuilder: (BuildContext context , int index) {
                return _cardProducto(listaProductos[index]);
              },
            ),
        ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.black,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spacing: 12,
        spaceBetweenChildren: 12,
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.pie_chart
            ),
            label: 'Reporte',
            onTap: () => Navigator.pushNamed(context, ReportComScreen.routeName)
          ),
          SpeedDialChild(
              child: const Icon(
                  Icons.computer
              ),
              label: 'Agregar',
              onTap: () => Navigator.pushNamed(context, ProductFormComScreen.routeName)
          ),
        ],
      ),
    );
  }
}
class _cardProducto extends StatelessWidget{
  final Producto producto;
  const _cardProducto(this.producto);
  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.5),
              offset: const Offset(3, 2),
              blurRadius: 7
          )
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 140,
                  child: FadeInImage(
                    placeholder: const AssetImage("assets/images/R.gif"),
                    image: NetworkImage(producto.imagen,),
                    fit: BoxFit.cover,
                  ),
                )
            ),
          ),
          Text(producto.descripcion,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
          const Text("Admin", style: TextStyle(
              fontSize: 14,
              color: Colors.grey
          ),
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: const EdgeInsets.only(left: 6.0),
                child: Text("S/ ${producto.precio}",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),),
              ),
              const SizedBox(width: 30,),
              IconButton(
                  onPressed: (){
                    Navigator.pushNamed(
                        context, ProductFormComScreen.routeName,
                        arguments: producto);
                  },
                  icon: const Icon(Icons.edit))
            ],
          )
        ],
      ),
    );
  }
}


