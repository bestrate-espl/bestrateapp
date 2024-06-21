import 'dart:convert';

class ProfileModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final Data? data;
  final String? errorMsg;
  final bool? isError;

  ProfileModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
    this.errorMsg,
    this.isError
  });

  factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
  final int? buyerId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobileNumber;
  final dynamic city;
  final String? area;
  final String? pincode;
  final String? entity;
  final String? businessName;
  final String? gst;

  Data({
    this.buyerId,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.city,
    this.area,
    this.pincode,
    this.entity,
    this.businessName,
    this.gst,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    buyerId: json["buyer_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    mobileNumber: json["mobile_number"],
    city: json["city"],
    area: json["area"],
    pincode: json["pincode"],
    entity: json["entity"],
    businessName: json["business_name"],
    gst: json["gst"],
  );

  Map<String, dynamic> toJson() => {
    "buyer_id": buyerId,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "mobile_number": mobileNumber,
    "city": city,
    "area": area,
    "pincode": pincode,
    "entity": entity,
    "business_name": businessName,
    "gst": gst,
  };
}
