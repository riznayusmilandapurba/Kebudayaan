// To parse this JSON data, do
//
//     final modelkonten = modelkontenFromJson(jsonString);

import 'dart:convert';

ModelSejarawan ModelSejarawanFromJson(String str) => ModelSejarawan.fromJson(json.decode(str));

String ModelSejarawanToJson(ModelSejarawan data) => json.encode(data.toJson());

class ModelSejarawan {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelSejarawan({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelSejarawan.fromJson(Map<String, dynamic> json) => ModelSejarawan(
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
  String nama;
  String tgl_lahir;
  String asal;
  String jk;
  String deskripsi;
  String foto;

  Datum({
    required this.id,
    required this.nama,
    required this.tgl_lahir,
    required this.asal,
    required this.jk,
    required this.deskripsi,
    required this.foto,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    nama: json["nama"],
    tgl_lahir: json["tgl_lahir"],
    asal: json["asal"],
    jk: json["jk"],
    deskripsi: json["deskripsi"],
    foto: json["foto"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "tgl_lahir": tgl_lahir,
    "asal": asal,
    "jk": jk,
    "deskripsi": deskripsi,
    "foto": foto,
  };
}
