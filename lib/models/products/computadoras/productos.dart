import 'dart:convert';

class Producto {
  Producto({
    required this.id,
    required this.productoId,
    required this.descripcion,
    required this.precio,
    required this.imagen,
    required this.categoria,
    required this.estado,
  });

  String id;
  int productoId;
  String descripcion;
  int precio;
  String imagen;
  String categoria;
  String estado;

  factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Producto.fromMap(Map<String, dynamic> json) => Producto(
    id: json["_id"],
    productoId: json["productoId"],
    descripcion: json["descripcion"],
    precio: json["precio"],
    imagen: json["imagen"],
    categoria: json["categoria"],
    estado: json["estado"]
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "productoId": productoId,
    "descripcion": descripcion,
    "precio": precio,
    "imagen": imagen,
    "categoria": categoria,
    "estado": estado,
  };
}
