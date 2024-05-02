// To parse this JSON data, do
//
//     final modelkonten = modelkontenFromJson(jsonString);

import 'dart:convert';

ModelTradisi ModelTradisiFromJson(String str) => ModelTradisi.fromJson(json.decode(str));

String ModelTradisiToJson(ModelTradisi data) => json.encode(data.toJson());

class ModelTradisi {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelTradisi({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelTradisi.fromJson(Map<String, dynamic> json) => ModelTradisi(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String judul;
  String konten;
  String gambar;

  Datum({
    required this.id,
    required this.judul,
    required this.konten,
    required this.gambar,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    judul: json["judul"],
    konten: json["konten"],
    gambar: json["gambar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "judul": judul,
    "konten": konten,
    "gambar": gambar,
  };
}
