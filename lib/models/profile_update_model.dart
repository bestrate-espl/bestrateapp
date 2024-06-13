import 'dart:convert';

class ProfileUpdateModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? errorMsg;
  final bool? isError;

  ProfileUpdateModel({
    this.statusCode,
    this.status,
    this.message,
    this.errorMsg,
    this.isError
  });

  factory ProfileUpdateModel.fromRawJson(String str) => ProfileUpdateModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileUpdateModel.fromJson(Map<String, dynamic> json) => ProfileUpdateModel(
    statusCode: json["status_code"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
  };
}
