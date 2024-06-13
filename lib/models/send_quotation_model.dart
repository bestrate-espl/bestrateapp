import 'dart:convert';

class SendQuotationModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? errorMsg;
  final bool? isError;

  SendQuotationModel({
    this.statusCode,
    this.status,
    this.message,
    this.errorMsg,
    this.isError
  });

  factory SendQuotationModel.fromRawJson(String str) => SendQuotationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SendQuotationModel.fromJson(Map<String, dynamic> json) => SendQuotationModel(
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
