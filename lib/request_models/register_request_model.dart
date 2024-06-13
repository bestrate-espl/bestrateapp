import 'dart:convert';

class RegisterRequestModel {
  late  String? firstName;
  late  String? lastName;
  late  int? mobileNumber;
  late  String? email;
  late  String? city;
  late  String? area;
  late  int? pincode;
  late  String? entity;
  late  String? businessName;
  late  String? gst;
  late  int? role;
  late  String? businessArea;
  late  String? businessPincode;
  late List<int>? keywords;

  RegisterRequestModel({
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.email,
    this.city,
    this.area,
    this.pincode,
    this.entity,
    this.businessName,
    this.gst,
    this.role,
    this.businessArea,
    this.businessPincode,
    this.keywords,
  });

  factory RegisterRequestModel.fromRawJson(String str) => RegisterRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => RegisterRequestModel(
    firstName: json["first_name"],
    lastName: json["last_name"],
    mobileNumber: json["mobile_number"],
    email: json["email"],
    city: json["city"],
    area: json["area"],
    pincode: json["pincode"],
    entity: json["entity"],
    businessName: json["business_name"],
    gst: json["gst"],
    role: json["role"],
    businessArea: json["business_area"],
    businessPincode: json["business_pincode"],
    keywords: json["keywords"] == null ? [] : List<int>.from(json["keywords"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "mobile_number": mobileNumber,
    "email": email,
    "city": city,
    "area": area,
    "pincode": pincode,
    "entity": entity,
    "business_name": businessName,
    "gst": gst,
    "role": role,
    "business_area": businessArea,
    "business_pincode": businessPincode,
    "keywords": keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
  };
}
