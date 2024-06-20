import 'dart:convert';

class CreateInquiriesModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? errorMsg;
  final bool? isError;

  CreateInquiriesModel({
    this.statusCode,
    this.status,
    this.message,
    this.errorMsg,
    this.isError
  });

  factory CreateInquiriesModel.fromRawJson(String str) => CreateInquiriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateInquiriesModel.fromJson(Map<String, dynamic> json) => CreateInquiriesModel(
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
