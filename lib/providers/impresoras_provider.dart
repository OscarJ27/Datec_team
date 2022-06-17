import 'dart:io';

import 'package:appdatec/models/products/impresoras/impresora_report.dart';
import 'package:appdatec/models/products/impresoras/impresoras.dart';
import 'package:appdatec/models/products/impresoras/impresoras_report_response.dart';
import 'package:appdatec/models/products/impresoras/impresoras_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImpresoraProvider extends ChangeNotifier{
  final String _baseUrl = '192.168.0.5:3000';

  List<Producto> listaProductos = [];
  List<ProductosReport> listaProductoReport = [];

  ImpresoraProvider(){
    debugPrint('Ingresando a ImpresoraProvider');
    getOnProductoList();
    reporteProducto();
  }
  getOnProductoList() async {
    var url = Uri.http(_baseUrl, '/api/impresoras',{});
    final response = await http.get(url);
    debugPrint(response.body);
    final productoResponse = ProductoResponse.fromJson(response.body);
    listaProductos = productoResponse.productos.cast<Producto>();
    notifyListeners();
  }
  saveProducto(Producto producto)async{
    var url = Uri.http(_baseUrl, '/api/impresoras/save');
    debugPrint(producto.toJson());
    final response = await http.post(url,
                                    headers: {HttpHeaders.contentTypeHeader:'application/json'},
                                    body:  producto.toJson()
    );
    debugPrint(response.body);
    getOnProductoList();
    notifyListeners();
  }
  reporteProducto() async{
    var url = Uri.http(_baseUrl, 'api/reportes/impresorasReport');
    final response = await http.get(url);
    final productoReportResponse = ProductoReportResponse.fromJson(response.body);
    listaProductoReport = productoReportResponse.productosReport;
    notifyListeners();
  }
}