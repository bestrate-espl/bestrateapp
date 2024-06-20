import 'dart:convert';

class BuyerAcceptInquiriesModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final List<AcceptedInquiry>? acceptedInquiries;
  final String? errorMsg;
  final bool? isError;

  BuyerAcceptInquiriesModel({
    this.statusCode,
    this.status,
    this.message,
    this.acceptedInquiries,
    this.errorMsg,
    this.isError
  });

  factory BuyerAcceptInquiriesModel.fromRawJson(String str) => BuyerAcceptInquiriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BuyerAcceptInquiriesModel.fromJson(Map<String, dynamic> json) => BuyerAcceptInquiriesModel(
    statusCode: json["status_code"],
    status: json["status"],
    message: json["message"],
    acceptedInquiries: json["accepted_inquiries"] == null ? [] : List<AcceptedInquiry>.from(json["accepted_inquiries"]!.map((x) => AcceptedInquiry.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "accepted_inquiries": acceptedInquiries == null ? [] : List<dynamic>.from(acceptedInquiries!.map((x) => x.toJson())),
  };
}

class AcceptedInquiry {
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? email;
  final String? area;
  final String? pincode;
  final String? entity;
  final dynamic businessName;
  final String? gst;
  final dynamic businessArea;
  final String? businessPincode;
  final String? quotationFiles;
  final String? quotedPrice;

  AcceptedInquiry({
    this.firstName,
    this.lastName,
    this.mobile,
    this.email,
    this.area,
    this.pincode,
    this.entity,
    this.businessName,
    this.gst,
    this.businessArea,
    this.businessPincode,
    this.quotationFiles,
    this.quotedPrice,
  });

  factory AcceptedInquiry.fromRawJson(String str) => AcceptedInquiry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AcceptedInquiry.fromJson(Map<String, dynamic> json) => AcceptedInquiry(
    firstName: json["first_name"],
    lastName: json["last_name"],
    mobile: json["mobile"],
    email: json["email"],
    area: json["area"],
    pincode: json["pincode"],
    entity: json["entity"],
    businessName: json["business_name"],
    gst: json["gst"],
    businessArea: json["business_area"],
    businessPincode: json["business_pincode"],
    quotationFiles: json["quotation_files"],
    quotedPrice: json["quoted_price"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "mobile": mobile,
    "email": email,
    "area": area,
    "pincode": pincode,
    "entity": entity,
    "business_name": businessName,
    "gst": gst,
    "business_area": businessArea,
    "business_pincode": businessPincode,
    "quotation_files": quotationFiles,
    "quoted_price": quotedPrice,
  };
}
