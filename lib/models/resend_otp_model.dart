import 'dart:convert';

class ResendOtpModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? otp;
  final String? errorMsg;
  final bool? isError;

  ResendOtpModel({
    this.statusCode,
    this.status,
    this.message,
    this.otp,
    this.errorMsg,
    this.isError
  });

  factory ResendOtpModel.fromRawJson(String str) => ResendOtpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResendOtpModel.fromJson(Map<String, dynamic> json) => ResendOtpModel(
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
