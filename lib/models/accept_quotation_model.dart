import 'dart:convert';

class AcceptQuotationModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? errorMsg;
  final bool? isError;

  AcceptQuotationModel({
    this.statusCode,
    this.status,
    this.message,
    this.errorMsg,
    this.isError
  });

  factory AcceptQuotationModel.fromRawJson(String str) => AcceptQuotationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AcceptQuotationModel.fromJson(Map<String, dynamic> json) => AcceptQuotationModel(
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
