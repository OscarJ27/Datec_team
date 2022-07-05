
import 'package:appdatec/Search/impresoras_search_delegate.dart';
import 'package:appdatec/models/products/impresoras/impresoras.dart';
import 'package:appdatec/providers/impresoras_provider.dart';
import 'package:appdatec/screens/drawer/menu_lateral.dart';
import 'package:appdatec/screens/products/impresoras/form/im_form.dart';
import 'package:appdatec/screens/products/impresoras/report/report_impresoras_screen.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

class ImpresorasComScreen extends StatefulWidget {
  const ImpresorasComScreen({Key? key}) : super(key: key);
  static String routeName = "/impresoraScreen";
  @override
  State<ImpresorasComScreen> createState() => _ImpresorasComScreenState();
}

class _ImpresorasComScreenState extends State<ImpresorasComScreen> {
  @override
  Widget build(BuildContext context) {

    final impresoraProvider = Provider.of<ImpresoraProvider>(context);
    final List<Producto> listaProductos = impresoraProvider.listaProductos.cast<Producto>();

    final size = MediaQuery.of(context).size;



    
    return Scaffold(
    appBar: AppBar(
        title: const Text("Impresoras"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ImpresoraSearchDelegate(listaProductos)
              );
            },
          )
        ],
      ),

      drawer: const MenuLateral(),
      body: Container(
        width: double.infinity,
        height: size.height * 0.7,
        color: Colors.white,
        child: Swiper(
          itemCount: listaProductos.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.8,
          itemHeight: size.height * 0.7,
          itemBuilder: (BuildContext context, int index) {
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
              child: const Icon(Icons.pie_chart),
              label: 'reporte',
              onTap: () => Navigator.pushNamed(context, ImpresoraReportScreen.routeName),
            ),
            SpeedDialChild(
                child: const Icon(Icons.watch),
                label: 'form',
              onTap: () => Navigator.pushNamed(context, ImpresoraForm.routeName),
            ),
          ],
      ),
    );
  }
}

class _cardProducto extends StatelessWidget {
  final Producto producto;
  _cardProducto(this.producto);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 140, bottom: 20),
      width: double.infinity,
      height: size.height * 0.5,
      decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [_ImagenFondo(producto), _EtiquetaPrecio(producto)],
      ),
    );
  }
}
class _ImagenFondo extends StatelessWidget {
  final Producto producto;
  _ImagenFondo(this.producto);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
            placeholder: AssetImage('assets/images/R.gif'),
            image: NetworkImage(producto.imagen),
            fit: BoxFit.cover),
      ),
    );
  }
}
class _EtiquetaPrecio extends StatelessWidget {
  final Producto producto;
  _EtiquetaPrecio(this.producto);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          color: Color.fromARGB(255, 63, 224, 130)),
      child: ListTile(
        title: Text(
          producto.descripcion,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
        ),
        subtitle: Text(
          'S/.' + producto.precio.toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 13, 13, 14)),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.edit,
            color: Color.fromARGB(255, 3, 33, 85),
          ),
          onPressed: () {
            Navigator.pushNamed(
                context,ImpresoraForm.routeName,
                arguments: producto);
          },
        ),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
        ]);