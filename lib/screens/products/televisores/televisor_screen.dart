import 'package:appdatec/models/products/televisores/televisor.dart';
import 'package:appdatec/providers/televisor_provider.dart';
import 'package:appdatec/screens/drawer/menu_lateral.dart';
import 'package:appdatec/screens/products/televisores/form/tele_form.dart';
import 'package:appdatec/screens/products/televisores/report/report_televisores_screen.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Televisores"),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView.builder(
          itemCount: listaTelevisor.length,
          itemBuilder: (context, index) {
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
                          image: NetworkImage(listaTelevisor[index].imagen),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          listaTelevisor[index].descripcion,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        subtitle: Text(
                          'S/. ${listaTelevisor[index].precio}',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
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

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
        ]);
