import 'dart:convert';

class RejectQuotationModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? errorMsg;
  final bool? isError;

  RejectQuotationModel({
    this.statusCode,
    this.status,
    this.message,
    this.errorMsg,
    this.isError
  });

  factory RejectQuotationModel.fromRawJson(String str) => RejectQuotationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RejectQuotationModel.fromJson(Map<String, dynamic> json) => RejectQuotationModel(
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
