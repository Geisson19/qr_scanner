// To parse this JSON data, do
//
//     final scanModel = scanModelFromMap(jsonString);

import 'dart:convert' show json;

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class ScanModel {
  ScanModel({
    this.id,
    this.tipo,
    required this.valor,
  }) {
    tipo = valor.contains("http") ? "http" : "geo";
    if (tipo == "geo") {
      if (valor.split("?").length > 1) {
        valor = valor.split("?")[0];
      }
      valor = valor.substring(4);
    }
  }

  int? id;
  String? tipo;
  String valor;

  LatLng? get latlng {
    final latlng = valor.split(",");
    return LatLng(
      double.parse(latlng[0]),
      double.parse(latlng[1]),
    );
  }

  factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["type"],
        valor: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": tipo,
        "value": valor,
      };
}
