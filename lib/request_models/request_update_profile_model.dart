import 'dart:convert';

class RequestUpdateProfileModel {
  int? userId;
  int? buyerid;
  String? firstName;
  String? lastName;
  int? pincode;
  String? area;
  String? entity;
  String? businessName;
  String? gst;
  int? mobileNumber;
  String? email;
 int? password;

  RequestUpdateProfileModel({
    this.userId,
    this.buyerid,
    this.firstName,
    this.lastName,
    this.pincode,
    this.area,
    this.entity,
    this.businessName,
    this.gst,
    this.mobileNumber,
    this.email,
    this.password,
  });

  factory RequestUpdateProfileModel.fromRawJson(String str) => RequestUpdateProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequestUpdateProfileModel.fromJson(Map<String, dynamic> json) => RequestUpdateProfileModel(
    userId: json["user_id"],
    buyerid: json["buyerid"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    pincode: json["pincode"],
    area: json["area"],
    entity: json["entity"],
    businessName: json["business_name"],
    gst: json["gst"],
    mobileNumber: json["mobile_number"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "buyerid": buyerid,
    "first_name": firstName,
    "last_name": lastName,
    "pincode": pincode,
    "area": area,
    "entity": entity,
    "business_name": businessName,
    "gst": gst,
    "mobile_number": mobileNumber,
    "email": email,
    "password": password,
  };
}
