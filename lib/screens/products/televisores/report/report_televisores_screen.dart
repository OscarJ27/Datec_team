import 'package:appdatec/models/products/televisores/televisor_report.dart';
import 'package:appdatec/providers/televisor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportTeleScreen extends StatefulWidget {
  const ReportTeleScreen({Key? key}) : super(key: key);
  static String routeName = "/reporttelevisor";

  @override
  State<ReportTeleScreen> createState() => _ReportTeleScreenState();
}

class _ReportTeleScreenState extends State<ReportTeleScreen> {
  @override
  Widget build(BuildContext context) {
    final televisorProvider = Provider.of<TelevisorProvider>(context);
    final List<TelevisorReport> listaTelevisorReport =
        televisorProvider.listaTelevisorReport;

    List<charts.Series<TelevisorReport, String>> serie = [
      charts.Series(
          id: 'ReporteTelevisor',
          data: listaTelevisorReport,
          domainFn: (TelevisorReport serie, _) => serie.id,
          measureFn: (TelevisorReport serie, _) => serie.count,
          colorFn: (TelevisorReport serie, _) => charts.ColorUtil.fromDartColor(
                Colors.blue,
              ))
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportes'),
      ),
      body: Container(
        height: 400,
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                const Text('REPORTES DE TELEVISORES POR CATEGORIA'),
                Expanded(
                  child: charts.BarChart(
                    serie,
                    animate: true,
                  ),
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
