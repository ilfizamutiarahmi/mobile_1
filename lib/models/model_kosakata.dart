// To parse this JSON data, do
//
//     final modelBerita = modelBeritaFromJson(jsonString);

import 'dart:convert';

ModelKosaKata modelKosaKataFromJson(String str) => ModelKosaKata.fromJson(json.decode(str));

String modelKosaKataToJson(ModelKosaKata data) => json.encode(data.toJson());

class ModelKosaKata {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelKosaKata({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelKosaKata.fromJson(Map<String, dynamic> json) => ModelKosaKata(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    // "isSuccess": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String hanzi;
  String pengucapan;
  String terjemahan;

  Datum({
    required this.id,
    required this.hanzi,
    required this.pengucapan,
    required this.terjemahan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    hanzi: json["hanzi"],
    pengucapan: json["pengucapan"],
    terjemahan: json["terjemahan"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hanzi": hanzi,
    "pengucapan": pengucapan,
    "terjemahan": terjemahan,
  };
}
