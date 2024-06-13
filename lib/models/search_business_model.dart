import 'dart:convert';

class SearchBusinessModel {
  final int? statusCode;
  final bool? status;
  final List<BusinessData>? matchedKeywords;
  final String? errorMsg;
  final bool? isError;

  SearchBusinessModel({
    this.statusCode,
    this.status,
    this.matchedKeywords,
    this.errorMsg,
    this.isError
  });

  factory SearchBusinessModel.fromRawJson(String str) => SearchBusinessModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchBusinessModel.fromJson(Map<String, dynamic> json) => SearchBusinessModel(
    statusCode: json["status_code"],
    status: json["status"],
    matchedKeywords: json["matched_keywords"] == null ? [] : List<BusinessData>.from(json["matched_keywords"]!.map((x) => BusinessData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "matched_keywords": matchedKeywords == null ? [] : List<dynamic>.from(matchedKeywords!.map((x) => x.toJson())),
  };
}

class BusinessData {
  final int? id;
  final String? name;
  final String? status;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BusinessData({
    this.id,
    this.name,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory BusinessData.fromRawJson(String str) => BusinessData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BusinessData.fromJson(Map<String, dynamic> json) => BusinessData(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    createdBy: json["created_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "created_by": createdBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
