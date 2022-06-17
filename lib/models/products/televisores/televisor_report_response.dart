import 'dart:convert';

import 'package:appdatec/models/products/televisores/televisor_report.dart';

class TelevisorReportResponse {
  TelevisorReportResponse({
    required this.status,
    required this.televisorReport,
  });

  String status;
  List<TelevisorReport> televisorReport;

  factory TelevisorReportResponse.fromJson(String str) =>
      TelevisorReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TelevisorReportResponse.fromMap(Map<String, dynamic> json) =>
      TelevisorReportResponse(
        status: json["status"],
        televisorReport: List<TelevisorReport>.from(
            json["televisorReport"].map((x) => TelevisorReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "televisorReport":
            List<dynamic>.from(televisorReport.map((x) => x.toMap())),
      };
}
