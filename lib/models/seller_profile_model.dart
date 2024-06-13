import 'dart:convert';

class SellerProfileModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final Data? data;
  final String? errorMsg;
  final bool? isError;

  SellerProfileModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
    this.errorMsg,
    this.isError
  });

  factory SellerProfileModel.fromRawJson(String str) => SellerProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SellerProfileModel.fromJson(Map<String, dynamic> json) => SellerProfileModel(
    statusCode: json["status_code"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final int? sellerId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobile;
  late final String? area;
  final String? pincode;
  final String? entity;
  final dynamic businessName;
  final dynamic businessArea;
  final String? businessPincode;
  final String? gst;
  final List<String>? keywords;

  Data({
    this.sellerId,
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.area,
    this.pincode,
    this.entity,
    this.businessName,
    this.businessArea,
    this.businessPincode,
    this.gst,
    this.keywords,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    sellerId: json["seller_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    mobile: json["mobile"],
    area: json["area"],
    pincode: json["pincode"],
    entity: json["entity"],
    businessName: json["business_name"],
    businessArea: json["business_area"],
    businessPincode: json["business_pincode"],
    gst: json["gst"],
    keywords: json["keywords"] == null ? [] : List<String>.from(json["keywords"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "seller_id": sellerId,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "mobile": mobile,
    "area": area,
    "pincode": pincode,
    "entity": entity,
    "business_name": businessName,
    "business_area": businessArea,
    "business_pincode": businessPincode,
    "gst": gst,
    "keywords": keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
  };
}
