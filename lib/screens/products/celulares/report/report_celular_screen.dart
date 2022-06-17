import 'package:appdatec/models/products/celulares/movil_report.dart';
import 'package:appdatec/providers/celulares_provider.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class CelularesReportScreen extends StatefulWidget {
  const CelularesReportScreen({Key? key}) : super(key: key);
  static String routeName = "/reportMoviles";
  @override
  State<CelularesReportScreen> createState() => _CelularesReportScreen();
}

class _CelularesReportScreen extends State<CelularesReportScreen> {
  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<CelularProvider>(context);
    final List<ProductosReport> listaProductoReport = productoProvider.listaProductoReport;

    List<charts.Series<ProductosReport, String>> serie = [
      charts.Series(
          id: 'ReporteProducto',
          data: listaProductoReport,
          domainFn: (ProductosReport serie,_)=> serie.id,
          measureFn: (ProductosReport serie,_)=> serie.count,
          colorFn: (ProductosReport serie,_)=> charts.ColorUtil.fromDartColor(Colors.blue,)
      )
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Reportes'),),
      body: Container(
        height: 400,
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                const Text('REPORTES DE PRODUCTOS POR CATEGORIA'),
                Expanded(
                  child: charts.BarChart(serie, animate: true,),
                ),
                const Text('FUENTE: MONGODB')
              ],
            ),
          ),
        ),
      ),
    );

  }
}