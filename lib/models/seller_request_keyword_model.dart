import 'dart:convert';

class SellerRequestKeywordModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? errorMsg;
  final bool? isError;

  SellerRequestKeywordModel({
    this.statusCode,
    this.status,
    this.message,
    this.errorMsg,
    this.isError
  });

  factory SellerRequestKeywordModel.fromRawJson(String str) => SellerRequestKeywordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SellerRequestKeywordModel.fromJson(Map<String, dynamic> json) => SellerRequestKeywordModel(
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
