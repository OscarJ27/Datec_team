import 'dart:convert';

class Metodo {
  Metodo({
    required this.id,
    required this.metodoId,
    required this.cvv,
    required this.nombApellido,
    required this.tarjeta,
    required this.vencimiento,
  });

  String id;
  int metodoId;
  int cvv;
  String nombApellido;
  int tarjeta;
  String vencimiento;

  factory Metodo.fromJson(String str) => Metodo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Metodo.fromMap(Map<String, dynamic> json) => Metodo(
        id: json["_id"],
        metodoId: json["metodoId"],
        cvv: json["cvv"],
        nombApellido: json["nombApellido"],
        tarjeta: json["tarjeta"],
        vencimiento: json["vencimiento"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "metodoId": metodoId,
        "cvv": cvv,
        "nombApellido": nombApellido,
        "tarjeta": tarjeta,
        "vencimiento": vencimiento,
      };
}
