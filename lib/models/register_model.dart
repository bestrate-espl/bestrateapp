import 'dart:convert';

class RegisterModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? mobileOtp;
  final String? emailOtp;
  final int? userId;
  final String? email;
  final int? mobileNumber;
  final bool? isRegistered;
  final bool? isVerified;
  final String? errorMsg;
  final bool? isError;

  RegisterModel({
    this.statusCode,
    this.status,
    this.message,
    this.mobileOtp,
    this.emailOtp,
    this.userId,
    this.email,
    this.mobileNumber,
    this.isRegistered,
    this.isVerified,
    this.errorMsg,
    this.isError
  });

  factory RegisterModel.fromRawJson(String str) => RegisterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    statusCode: json["status_code"],
    status: json["status"],
    message: json["message"],
    mobileOtp: json["mobile_otp"],
    emailOtp: json["email_otp"],
    userId: json["user_id"],
    email: json["email"],
    mobileNumber: json["mobile_number"],
    isRegistered: json["is_registered"],
    isVerified: json["is_verified"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "mobile_otp": mobileOtp,
    "email_otp": emailOtp,
    "user_id": userId,
    "email": email,
    "mobile_number": mobileNumber,
    "is_registered": isRegistered,
    "is_verified": isVerified,
  };
}
