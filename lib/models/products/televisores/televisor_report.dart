import 'dart:convert';

class TelevisorReport {
  TelevisorReport({
    required this.id,
    required this.count,
  });

  String id;
  int count;

  factory TelevisorReport.fromJson(String str) =>
      TelevisorReport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TelevisorReport.fromMap(Map<String, dynamic> json) => TelevisorReport(
        id: json["_id"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
      };
}
