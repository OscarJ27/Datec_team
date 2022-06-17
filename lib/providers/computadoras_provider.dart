import 'dart:io';

import 'package:appdatec/models/products/computadoras/productos_response.dart';
import 'package:appdatec/models/products/computadoras/product_report.dart';
import 'package:appdatec/models/products/computadoras/productos_report_response.dart';
import 'package:flutter/material.dart';
import '../models/products/computadoras/productos.dart';
import 'package:http/http.dart' as http;

class ComputoProvider extends ChangeNotifier{
  final String _baseUrl = '192.168.0.5:3000';

  List<Producto> listaProductos = [];
  List<ProductosReport> listaProductoReport = [];

  ComputoProvider(){
    debugPrint('Ingresando a ComputoProvider');
    getOnProductoList();
    reporteProducto();
  }
  getOnProductoList() async {
    var url = Uri.http(_baseUrl, '/api/computo',{});
    final response = await http.get(url);
    debugPrint(response.body);
    final productoResponse = ProductoResponse.fromJson(response.body);
    listaProductos = productoResponse.productos.cast<Producto>();
    notifyListeners();
  }
  saveProducto(Producto producto)async{
    var url = Uri.http(_baseUrl, '/api/computo/save');
    debugPrint(producto.toJson());
    final response = await http.post(url,
                                    headers: {HttpHeaders.contentTypeHeader:'application/json'},
                                    body:  producto.toJson()
    );
    debugPrint(response.body);
    getOnProductoList();
    notifyListeners();
    reporteProducto();
  }
  reporteProducto() async{
    var url = Uri.http(_baseUrl, 'api/reportes/computoReport');
    final response = await http.get(url);
    final productoReportResponse = ProductoReportResponse.fromJson(response.body);
    listaProductoReport = productoReportResponse.productosReport;
    notifyListeners();
  }
}