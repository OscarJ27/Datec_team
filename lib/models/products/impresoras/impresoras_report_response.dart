import 'dart:convert';

import 'package:appdatec/models/products/impresoras/impresora_report.dart';



class ProductoReportResponse{
    ProductoReportResponse({
      required this.productosReport,
});
    
    List<ProductosReport> productosReport;
    
    factory ProductoReportResponse.fromJson(String str) => ProductoReportResponse.fromMap(json.decode(str));
    String toJson() => json.encode(toMap());

    factory ProductoReportResponse.fromMap(Map<String, dynamic> json) => ProductoReportResponse(
        productosReport: List<ProductosReport>.from(json["productosReport"].map((x)=> ProductosReport.fromMap(x)))
    );
    
    Map<String, dynamic> toMap() => {
      "productosReport": List<dynamic>.from(productosReport.map((x) => x.toMap())),
    };
}