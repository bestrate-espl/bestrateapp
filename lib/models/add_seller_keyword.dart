import 'dart:convert';

class AddSellerKeywordModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? errorMsg;
  final bool? isError;

  AddSellerKeywordModel({
    this.statusCode,
    this.status,
    this.message,
    this.errorMsg,
    this.isError
  });

  factory AddSellerKeywordModel.fromRawJson(String str) => AddSellerKeywordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddSellerKeywordModel.fromJson(Map<String, dynamic> json) => AddSellerKeywordModel(
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
