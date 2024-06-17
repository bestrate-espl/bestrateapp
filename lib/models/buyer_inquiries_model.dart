import 'dart:convert';

class BuyerInquiriesModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final int? totalInquiries;
  final int? latestBids;
  final List<Inquiry>? inquiries;
  final String? errorMsg;
  final bool? isError;

  BuyerInquiriesModel({
    this.statusCode,
    this.status,
    this.message,
    this.totalInquiries,
    this.latestBids,
    this.inquiries,
    this.errorMsg,
    this.isError
  });

  factory BuyerInquiriesModel.fromRawJson(String str) => BuyerInquiriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BuyerInquiriesModel.fromJson(Map<String, dynamic> json) => BuyerInquiriesModel(
    statusCode: json["status_code"],
    status: json["status"],
    message: json["message"],
    totalInquiries: json["total_inquiries"],
    latestBids: json["latest_bids"],
    inquiries: json["inquiries"] == null ? [] : List<Inquiry>.from(json["inquiries"]!.map((x) => Inquiry.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "total_inquiries": totalInquiries,
    "latest_bids": latestBids,
    "inquiries": inquiries == null ? [] : List<dynamic>.from(inquiries!.map((x) => x.toJson())),
  };
}

class Inquiry {
  final int? inquiryid;
  final String? product;
  final String? quantity;
  final String? inquiryDate;
  final dynamic inquiryTime;
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
