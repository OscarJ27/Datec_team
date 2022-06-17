import 'dart:convert';

import 'package:appdatec/models/payments/metodo.dart';

class MetodoResponse {
  MetodoResponse({
    required this.metodos,
  });

  List<Metodo> metodos;

  factory MetodoResponse.fromJson(String str) =>
      MetodoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MetodoResponse.fromMap(Map<String, dynamic> json) => MetodoResponse(
        metodos:
            List<Metodo>.from(json["metodos"].map((x) => Metodo.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "metodos": List<dynamic>.from(metodos.map((x) => x.toMap())),
      };
}
