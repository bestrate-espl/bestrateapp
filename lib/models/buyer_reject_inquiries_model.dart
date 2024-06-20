import 'dart:convert';

class BuyerRejectInquiriesModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final List<RejectedInquiry>? rejectedInquiries;
  final String? errorMsg;
  final bool? isError;

  BuyerRejectInquiriesModel({
    this.statusCode,
    this.status,
    this.message,
    this.rejectedInquiries,
    this.errorMsg,
    this.isError
  });

  factory BuyerRejectInquiriesModel.fromRawJson(String str) => BuyerRejectInquiriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BuyerRejectInquiriesModel.fromJson(Map<String, dynamic> json) => BuyerRejectInquiriesModel(
    statusCode: json["status_code"],
    status: json["status"],
    message: json["message"],
    rejectedInquiries: json["rejected_inquiries"] == null ? [] : List<RejectedInquiry>.from(json["rejected_inquiries"]!.map((x) => RejectedInquiry.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "rejected_inquiries": rejectedInquiries == null ? [] : List<dynamic>.from(rejectedInquiries!.map((x) => x.toJson())),
  };
}

class RejectedInquiry {
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


  RejectedInquiry({
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

  factory RejectedInquiry.fromRawJson(String str) => RejectedInquiry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RejectedInquiry.fromJson(Map<String, dynamic> json) => RejectedInquiry(
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
