import 'dart:convert';

class SellerKeywordsModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final List<SellerKeywordData>? data;
  final String? errorMsg;
  final bool? isError;

  SellerKeywordsModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
    this.errorMsg,
    this.isError
  });

  factory SellerKeywordsModel.fromRawJson(String str) => SellerKeywordsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SellerKeywordsModel.fromJson(Map<String, dynamic> json) => SellerKeywordsModel(
    statusCode: json["status_code"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SellerKeywordData>.from(json["data"]!.map((x) => SellerKeywordData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SellerKeywordData {
  final String? isDelete;
  final String? keywordName;
  final int? sellerkeywordId;
  final String? addedDate;

  SellerKeywordData({
    this.isDelete,
    this.keywordName,
    this.sellerkeywordId,
    this.addedDate,
  });

  factory SellerKeywordData.fromRawJson(String str) => SellerKeywordData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SellerKeywordData.fromJson(Map<String, dynamic> json) => SellerKeywordData(
    isDelete: json["is_delete"],
    keywordName: json["keyword_name"],
    sellerkeywordId: json["sellerkeyword_id"],
    addedDate: json["added_date"],
  );

  Map<String, dynamic> toJson() => {
    "is_delete": isDelete,
    "keyword_name": keywordName,
    "sellerkeyword_id": sellerkeywordId,
    "added_date": addedDate,
  };
}
