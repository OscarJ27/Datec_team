import 'package:appdatec/models/products/computadoras/product_report.dart';
import 'package:appdatec/providers/computadoras_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportComScreen extends StatefulWidget {
  const ReportComScreen({Key? key}) : super(key: key);
  static String routeName = "/reportproduct";

  @override
  State<ReportComScreen> createState() => _ReportComScreenState();
}

class _ReportComScreenState extends State<ReportComScreen> {
  @override
  Widget build(BuildContext context) {
    final computoProvider = Provider.of<ComputoProvider>(context);
    final List<ProductosReport> listaProductoReport = computoProvider.listaProductoReport;

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
                const Text('REPORTES DE PRODUCTOS POR MARCA'),
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
