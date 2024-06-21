import 'dart:convert';

class VerifyOtpModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? token;
  final Data? data;
  final String? errorMsg;
  final bool? isError;

  VerifyOtpModel({
    this.statusCode,
    this.status,
    this.message,
    this.token,
    this.data,
    this.errorMsg,
    this.isError
  });

  factory VerifyOtpModel.fromRawJson(String str) => VerifyOtpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
    statusCode: json["status_code"],
    status: json["status"],
    message: json["message"],
    token: json["token"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "token": token,
    "data": data?.toJson(),
  };
}

class Data {
  final int? userid;
  final int? profileId;
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
    this.userid,
    this.profileId,
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
    userid: json["userid"],
    profileId: json["profile_id"],
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
    "userid": userid,
    "profile_id": profileId,
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
