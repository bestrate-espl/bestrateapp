import 'dart:convert';

class LoginModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? otp;
  final String? errorMsg;
  final bool? isError;

  LoginModel({
    this.statusCode,
    this.status,
    this.message,
    this.otp,
    this.errorMsg,
    this.isError
  });

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    statusCode: json["status_code"],
    status: json["status"],
    message: json["message"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "otp": otp,
  };
}
