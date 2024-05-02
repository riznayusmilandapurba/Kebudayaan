import 'dart:convert';

class ModelLogin {
  int value;
  String message;
  String fullname;
  String phone;
  String email;
  String id;

  ModelLogin({
    required this.value,
    required this.message,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.id,
  });

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
        value: json["value"],
        message: json["message"],
        fullname: json["fullname"],
        phone: json["phone"],
        email: json["email"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "message": message,
        "fullname": fullname,
        "phone": phone,
        "email": email,
        "id": id,
      };

  bool isLoginSuccess() {
    return value == 1;
  }
}

ModelLogin modelLoginFromJson(String str) =>
    ModelLogin.fromJson(json.decode(str));

String modelLoginToJson(ModelLogin data) => json.encode(data.toJson());
