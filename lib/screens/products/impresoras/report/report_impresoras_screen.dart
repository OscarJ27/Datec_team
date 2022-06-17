import 'package:appdatec/models/products/impresoras/impresora_report.dart';
import 'package:appdatec/providers/impresoras_provider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class ImpresoraReportScreen extends StatefulWidget {
  const ImpresoraReportScreen({Key? key}) : super(key: key);
  static String routeName = "/reportimpresora";
  @override
  State<ImpresoraReportScreen> createState() => _ImpresoraReportScreenState();
}

class _ImpresoraReportScreenState extends State<ImpresoraReportScreen> {
  @override
  Widget build(BuildContext context) {
    final impresoraProvider = Provider.of<ImpresoraProvider>(context);
    final List<ProductosReport> listaProductoReport = impresoraProvider.listaProductoReport;

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