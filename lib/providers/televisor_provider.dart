import 'dart:io';

import 'package:appdatec/models/products/televisores/televisor.dart';
import 'package:appdatec/models/products/televisores/televisor_report.dart';
import 'package:appdatec/models/products/televisores/televisor_report_response.dart';
import 'package:appdatec/models/products/televisores/televisor_response.dart';
import 'package:flutter/material.dart';
import '../models/products/televisores/televisor.dart';
import 'package:http/http.dart' as http;

class TelevisorProvider extends ChangeNotifier {
  final String _baseUrl = '192.168.0.2:3000';

  List<Televisor> listaTelevisor = [];
  List<TelevisorReport> listaTelevisorReport = [];

  TelevisorProvider() {
    debugPrint('Ingresando a TelevisorProvider');
    getOnTelevisorList();
    reporteTelevisor();
  }
  getOnTelevisorList() async {
    var url = Uri.http(_baseUrl, '/api/televisor', {});
    final response = await http.get(url);
    debugPrint(response.body);
    final televisorResponse = TelevisorResponse.fromJson(response.body);
    listaTelevisor = televisorResponse.televisor.cast<Televisor>();
    notifyListeners();
  }

  saveTelevisor(Televisor televisor) async {
    var url = Uri.http(_baseUrl, '/api/televisor/save');
    debugPrint(televisor.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: televisor.toJson());
    debugPrint(response.body);
    getOnTelevisorList();
    notifyListeners();
    reporteTelevisor();
  }

  reporteTelevisor() async {
    var url = Uri.http(_baseUrl, 'api/reportes/televisorReport');
    final response = await http.get(url);
    final televisorReportResponse =
        TelevisorReportResponse.fromJson(response.body);
    listaTelevisorReport = televisorReportResponse.televisorReport;
    notifyListeners();
  }
}
