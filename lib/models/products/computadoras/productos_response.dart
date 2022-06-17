import 'dart:convert';

import 'package:appdatec/models/products/computadoras/productos.dart';

class ProductoResponse {
  ProductoResponse({
    required this.productos,
  });

  List<Producto> productos;

  factory ProductoResponse.fromJson(String str) => ProductoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductoResponse.fromMap(Map<String, dynamic> json) => ProductoResponse(
    productos: List<Producto>.from(json["Productos"].map((x) => Producto.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "Productos": List<dynamic>.from(productos.map((x) => x.toMap())),
  };
}