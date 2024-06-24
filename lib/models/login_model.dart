import 'dart:convert';

class LoginModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? otp;
  final bool? isVerfied;
  final Data? data;
  final String? errorMsg;
  final bool? isError;

  LoginModel({
    this.statusCode,
    this.status,
    this.message,
    this.otp,
    this.isVerfied,
    this.data,
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
    isVerfied: json["is_verfied"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "otp": otp,
    "is_verfied": isVerfied,
    "data": data?.toJson(),
  };
}

class Data {
  final int? userId;
  final String? email;
  final String? mobile;
  final String? emailOtp;
  final String? mobileOtp;

  Data({
    this.userId,
    this.email,
    this.mobile,
    this.emailOtp,
    this.mobileOtp,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    email: json["email"],
    mobile: json["mobile"],
    emailOtp: json["email_otp"],
    mobileOtp: json["mobile_otp"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "email": email,
    "mobile": mobile,
    "email_otp": emailOtp,
    "mobile_otp": mobileOtp,
  };
}
