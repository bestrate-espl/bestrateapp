import 'dart:convert';

class ProfileUpdateRequestModel {
  int? sellerId;
  String? firstName;
  String? lastName;
  String? area;
  int? pincode;
  String? entity;
  String? businessName;
  int? gst;
  String? businessArea;
  int? businessPincode;
  String? mobileNumber;
  String? email;
  int? password;
  List<int>? keywords;
  int? userId;

  ProfileUpdateRequestModel({
    this.sellerId,
    this.firstName,
    this.lastName,
    this.area,
    this.pincode,
    this.entity,
    this.businessName,
    this.gst,
    this.businessArea,
    this.businessPincode,
    this.mobileNumber,
    this.email,
    this.password,
    this.keywords,
    this.userId,
  });

  factory ProfileUpdateRequestModel.fromRawJson(String str) => ProfileUpdateRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileUpdateRequestModel.fromJson(Map<String, dynamic> json) => ProfileUpdateRequestModel(
    sellerId: json["seller_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    area: json["area"],
    pincode: json["pincode"],
    entity: json["entity"],
    businessName: json["business_name"],
    gst: json["gst"],
    businessArea: json["business_area"],
    businessPincode: json["business_pincode"],
    mobileNumber: json["mobile_number"],
    email: json["email"],
    password: json["password"],
    keywords: json["keywords"] == null ? [] : List<int>.from(json["keywords"]!.map((x) => x)),
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "seller_id": sellerId,
    "first_name": firstName,
    "last_name": lastName,
    "area": area,
    "pincode": pincode,
    "entity": entity,
    "business_name": businessName,
    "gst": gst,
    "business_area": businessArea,
    "business_pincode": businessPincode,
    "mobile_number": mobileNumber,
    "email": email,
    "password": password,
    "keywords": keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
    "user_id": userId,
  };
}
