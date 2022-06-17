import 'dart:io';

import 'package:flutter/material.dart';
import '../models/products/populares/popular.dart';
import '../models/products/populares/popular_response.dart';
import 'package:http/http.dart' as http;

class PopularProvider extends ChangeNotifier{
  final String _baseUrl = '192.168.0.5:3000';

  List<Producto> listaProductos = [];

  PopularProvider(){
    debugPrint('Ingresando a Populares');
    getOnProductoList();
  }
  getOnProductoList() async {
    var url = Uri.http(_baseUrl, '/api/Pproductos',{});
    final response = await http.get(url);
    debugPrint(response.body);
    final productoResponse = ProductoResponse.fromJson(response.body);
    listaProductos = productoResponse.productos.cast<Producto>();
    notifyListeners();
  }
  saveProducto(Producto producto)async{
    var url = Uri.http(_baseUrl, '/api/Pproductos/save');
    debugPrint(producto.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader:'application/json'},
        body:  producto.toJson()
    );
    debugPrint(response.body);
    getOnProductoList();
    notifyListeners();
  }
}