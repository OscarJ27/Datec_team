import 'package:appdatec/models/products/relojes/relojes.dart';
import 'package:appdatec/providers/relojes_provider.dart';
import 'package:appdatec/screens/drawer/menu_lateral.dart';
import 'package:appdatec/screens/products/relojes/form/co_form.dart';
import 'package:appdatec/screens/products/relojes/report/report_relojes_screen.dart';
import 'package:appdatec/search/reloj_search_delegate.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';



class RelojesScreen extends StatefulWidget {
  const RelojesScreen({Key? key}) : super(key: key);
  static String routeName = "/reloj";

  @override
  State<RelojesScreen> createState() => _RelojesScreenState();
}

class _RelojesScreenState extends State<RelojesScreen> {
  @override
  Widget build(BuildContext context) {

    final relojProvider = Provider.of<RelojProvider>(context);
    final List<Producto> listaProductos = relojProvider.listaProductos.cast<Producto>();

    final size = MediaQuery.of(context).size;


    return Scaffold(
    appBar: AppBar(
        title: const Text("Reloj"),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                context: context, 
                delegate: RelojSearchDelegate(listaProductos)
              );
            },// PENDIENTE
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
              onTap: () => Navigator.pushNamed(context, RelojReportScreen.routeName),
            ),
            SpeedDialChild(
                child: const Icon(Icons.watch),
                label: 'form',
              onTap: () => Navigator.pushNamed(context, RelojForm.routeName),
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
          color: Colors.amber),
      child: ListTile(
        title: Text(
          producto.descripcion,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        subtitle: Text(
          'S/.' + producto.precio.toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.edit,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            Navigator.pushNamed(
                context,RelojForm.routeName,
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



