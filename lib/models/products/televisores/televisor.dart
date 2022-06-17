import 'dart:convert';

class Televisor {
  Televisor({
    required this.id,
    required this.televisorId,
    required this.descripcion,
    required this.precio,
    required this.imagen,
    required this.categoria,
    required this.estado,
  });

  String id;
  int televisorId;
  String descripcion;
  int precio;
  String imagen;
  String categoria;
  String estado;

  factory Televisor.fromJson(String str) => Televisor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Televisor.fromMap(Map<String, dynamic> json) => Televisor(
        id: json["_id"],
        televisorId: json["televisorId"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        imagen: json["imagen"],
        categoria: json["categoria"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "televisorId": televisorId,
        "descripcion": descripcion,
        "precio": precio,
        "imagen": imagen,
        "categoria": categoria,
        "estado": estado,
      };
}
