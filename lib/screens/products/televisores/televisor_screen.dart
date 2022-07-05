import 'package:appdatec/models/products/televisores/televisor.dart';
import 'package:appdatec/providers/televisor_provider.dart';
import 'package:appdatec/screens/drawer/menu_lateral.dart';
import 'package:appdatec/screens/products/televisores/form/tele_form.dart';
import 'package:appdatec/screens/products/televisores/report/report_televisores_screen.dart';
import 'package:appdatec/search/televisor_search_delegate.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

class TelevisorScreen extends StatefulWidget {
  const TelevisorScreen({Key? key}) : super(key: key);
  static String routeName = "/televisores";

  @override
  State<TelevisorScreen> createState() => _TelevisorScreenState();
}

class _TelevisorScreenState extends State<TelevisorScreen> {
  @override
  Widget build(BuildContext context) {
    final televisorProvider = Provider.of<TelevisorProvider>(context);
    final List<Televisor> listaTelevisor =
        televisorProvider.listaTelevisor.cast<Televisor>();

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Televisores"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: TelevisorSearchDelegate(listaTelevisor));
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
          itemCount: listaTelevisor.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.8,
          itemHeight: size.height * 0.7,
          itemBuilder: (BuildContext context, int index) {
            return _cardTelevisor(listaTelevisor[index]);
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
            onTap: () =>
                Navigator.pushNamed(context, ReportTeleScreen.routeName),
          ),
          SpeedDialChild(
            child: const Icon(Icons.tv_outlined),
            label: 'form',
            onTap: () =>
                Navigator.pushNamed(context, TelevisorFormScreen.routeName),
          ),
        ],
      ),
    );
  }
}

class _cardTelevisor extends StatelessWidget {
  final Televisor televisor;
  _cardTelevisor(this.televisor);
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
        children: [
          _ImagenFondo(televisor),
          _EtiquetaPrecio(televisor),
        ],
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  final Televisor televisor;
  _ImagenFondo(this.televisor);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          placeholder: AssetImage('assets/images/R.gif'),
          image: NetworkImage(televisor.imagen),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _EtiquetaPrecio extends StatelessWidget {
  final Televisor televisor;
  _EtiquetaPrecio(this.televisor);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          color: Colors.amberAccent),
      child: ListTile(
        title: Text(
          televisor.descripcion,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        subtitle: Text(
          'S/.' + televisor.precio.toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.edit,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            Navigator.pushNamed(context, TelevisorFormScreen.routeName,
                arguments: televisor);
          },
        ),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
        ]);
