// To parse this JSON data, do
//
//     final modelkonten = modelkontenFromJson(jsonString);

import 'dart:convert';

ModelSejarah ModelSejarahFromJson(String str) => ModelSejarah.fromJson(json.decode(str));

String ModelSejarahToJson(ModelSejarah data) => json.encode(data.toJson());

class ModelSejarah {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelSejarah({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelSejarah.fromJson(Map<String, dynamic> json) => ModelSejarah(
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
