import 'package:appdatec/models/products/relojes/reloj_report.dart';
import 'package:appdatec/providers/relojes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;



class RelojReportScreen extends StatefulWidget {
  const RelojReportScreen({Key? key}) : super(key: key);
  static String routeName = "/reportreloj";

  @override
  State<RelojReportScreen> createState() => _RelojReportScreenState();
}

class _RelojReportScreenState extends State<RelojReportScreen> {
  @override
  Widget build(BuildContext context) {
     final relojProvider = Provider.of<RelojProvider>(context);
    final List<ProductosReport> listaProductoReport = relojProvider.listaProductoReport;

    List<charts.Series<ProductosReport, String>> serie = [
      charts.Series(
          id: 'ReporteProducto',
          data: listaProductoReport,
          domainFn: (ProductosReport serie,_)=> serie.id,
          measureFn: (ProductosReport serie,_)=> serie.count,
          colorFn: (ProductosReport serie,_)=> charts.ColorUtil.fromDartColor(Color.fromARGB(255, 5, 236, 28),)
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

