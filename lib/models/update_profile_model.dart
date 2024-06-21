import 'dart:convert';

class UpdateProfileModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? errorMsg;
  final bool? isError;

  UpdateProfileModel({
    this.statusCode,
    this.status,
    this.message,
    this.errorMsg,
    this.isError
  });

  factory UpdateProfileModel.fromRawJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
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
