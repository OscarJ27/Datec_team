import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/products/relojes/reloj_report.dart';
import '../models/products/relojes/relojes.dart';
import '../models/products/relojes/relojes_report_response.dart';
import '../models/products/relojes/relojes_response.dart';

class RelojProvider extends ChangeNotifier{
  final String _baseUrl = '192.168.0.5:3000';

  List<Producto> listaProductos = [];
  List<ProductosReport> listaProductoReport = [];

  RelojProvider(){
    debugPrint('Ingresando a RelojProvider');
    getOnProductoList();
    reporteProducto();
  }
  getOnProductoList() async {
    var url = Uri.http(_baseUrl, '/api/relojes',{});
    final response = await http.get(url);
    debugPrint(response.body);
    final productoResponse = ProductoResponse.fromJson(response.body);
    listaProductos = productoResponse.productos.cast<Producto>();
    notifyListeners();
  }
  saveProducto(Producto producto)async{
    var url = Uri.http(_baseUrl, '/api/relojes/save');
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
    var url = Uri.http(_baseUrl, 'api/reportes/relojesReport');
    final response = await http.get(url);
    final productoReportResponse = ProductoReportResponse.fromJson(response.body);
    listaProductoReport = productoReportResponse.productosReport;
    notifyListeners();
  }
}
