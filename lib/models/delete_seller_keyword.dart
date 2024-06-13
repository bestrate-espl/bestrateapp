import 'dart:convert';

class DeleteSellerKeywordModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? errorMsg;
  final bool? isError;

  DeleteSellerKeywordModel({
    this.statusCode,
    this.status,
    this.message,
    this.errorMsg,
    this.isError
  });

  factory DeleteSellerKeywordModel.fromRawJson(String str) => DeleteSellerKeywordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteSellerKeywordModel.fromJson(Map<String, dynamic> json) => DeleteSellerKeywordModel(
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
