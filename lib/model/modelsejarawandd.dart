

import 'dart:convert';

ModelSejarawanadd ModelSejarawanaddFromJson(String str) => ModelSejarawanadd.fromJson(json.decode(str));

String ModelSejarawanaddToJson(ModelSejarawanadd data) => json.encode(data.toJson());

class ModelSejarawanadd {
  int value;
  String message;

  ModelSejarawanadd({
    required this.value,
    required this.message,
  });

  factory ModelSejarawanadd.fromJson(Map<String, dynamic> json) => ModelSejarawanadd(
    value: json["value"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
  };
}
