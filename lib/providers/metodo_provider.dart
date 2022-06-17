import 'dart:io';
import 'package:appdatec/models/payments/metodo.dart';
import 'package:appdatec/models/payments/metodo_response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MetodoProvider extends ChangeNotifier {
  final String _baseUrl = '192.168.0.5:3000';

  List<Metodo> listaMetodos = [];

  MetodoProvider() {
    debugPrint('Ingresando a MetodoProvider');
    getOnMetodoList();
  }

  getOnMetodoList() async {
    var url = Uri.http(_baseUrl, '/api/metodos', {});
    final response = await http.get(url);
    debugPrint(response.body);
    final metodoResponse = MetodoResponse.fromJson(response.body);
    listaMetodos = metodoResponse.metodos;
    notifyListeners();
  }

  saveMetodo(Metodo metodo) async {
    var url = Uri.http(_baseUrl, '/api/metodos/save');
    debugPrint(metodo.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: metodo.toJson());
    debugPrint(response.body);
    getOnMetodoList();
    notifyListeners();
  }
}
