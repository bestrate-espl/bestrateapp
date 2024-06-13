import 'dart:convert';

class SellerInquiriesModel {
  final int? statusCode;
  final bool? status;
  final int? inquiriesReceived;
  final int? latestBidsOpen;
  final List<Inquiry>? inquiries;
  final String? errorMsg;
  final bool? isError;

  SellerInquiriesModel({
    this.statusCode,
    this.status,
    this.inquiriesReceived,
    this.latestBidsOpen,
    this.inquiries,
    this.errorMsg,
    this.isError
  });

  factory SellerInquiriesModel.fromRawJson(String str) => SellerInquiriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SellerInquiriesModel.fromJson(Map<String, dynamic> json) => SellerInquiriesModel(
    statusCode: json["status_code"],
    status: json["status"],
    inquiriesReceived: json["inquiries_received"],
    latestBidsOpen: json["latest_bids_open"],
    inquiries: json["inquiries"] == null ? [] : List<Inquiry>.from(json["inquiries"]!.map((x) => Inquiry.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "inquiries_received": inquiriesReceived,
    "latest_bids_open": latestBidsOpen,
    "inquiries": inquiries == null ? [] : List<dynamic>.from(inquiries!.map((x) => x.toJson())),
  };
}

class Inquiry {
  final int? inquiryid;
  final String? product;
  final String? quantity;
  final String? inquiryDate;
  final String? inquiryTime;
  final String? inquiryStatus;
  final String? budgetStart;
  final String? budgetEnd;

  Inquiry({
    this.inquiryid,
    this.product,
    this.quantity,
    this.inquiryDate,
    this.inquiryTime,
    this.inquiryStatus,
    this.budgetStart,
    this.budgetEnd,
  });

  factory Inquiry.fromRawJson(String str) => Inquiry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Inquiry.fromJson(Map<String, dynamic> json) => Inquiry(
    inquiryid: json["inquiryid"],
    product: json["product"],
    quantity: json["quantity"],
    inquiryDate: json["inquiry_date"],
    inquiryTime: json["inquiry_time"],
    inquiryStatus: json["inquiry_status"],
    budgetStart: json["budget_start"],
    budgetEnd: json["budget_end"],
  );

  Map<String, dynamic> toJson() => {
    "inquiryid": inquiryid,
    "product": product,
    "quantity": quantity,
    "inquiry_date": inquiryDate,
    "inquiry_time": inquiryTime,
    "inquiry_status": inquiryStatus,
    "budget_start": budgetStart,
    "budget_end": budgetEnd,
  };
}
