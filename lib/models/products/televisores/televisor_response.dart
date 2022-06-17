import 'dart:convert';

import 'package:appdatec/models/products/televisores/televisor.dart';

class TelevisorResponse {
  TelevisorResponse({
    required this.televisor,
  });

  List<Televisor> televisor;

  factory TelevisorResponse.fromJson(String str) =>
      TelevisorResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TelevisorResponse.fromMap(Map<String, dynamic> json) =>
      TelevisorResponse(
        televisor: List<Televisor>.from(
            json["televisor"].map((x) => Televisor.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "televisor": List<dynamic>.from(televisor.map((x) => x.toMap())),
      };
}
