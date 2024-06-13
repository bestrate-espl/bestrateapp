import 'dart:convert';

class SellerInquiriesDetailsModel {
  final int? statusCode;
  final bool? status;
  final Inquiries? inquiries;
  final String? errorMsg;
  final bool? isError;

  SellerInquiriesDetailsModel({
    this.statusCode,
    this.status,
    this.inquiries,
    this.errorMsg,
    this.isError
  });

  factory SellerInquiriesDetailsModel.fromRawJson(String str) => SellerInquiriesDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SellerInquiriesDetailsModel.fromJson(Map<String, dynamic> json) => SellerInquiriesDetailsModel(
    statusCode: json["status_code"],
    status: json["status"],
    inquiries: json["inquiries"] == null ? null : Inquiries.fromJson(json["inquiries"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "inquiries": inquiries?.toJson(),
  };
}

class Inquiries {
  final int? inquiryid;
  final String? inquiryDate;
  final String? inquiryTime;
  final String? product;
  final String? quantity;
  final String? budget;
  final String? requestDate;
  final String? responseDate;
  final String? amount;
  final String? timeToSendQuotation;
  final String? buyerName;
  final String? buyerEmail;

  Inquiries({
    this.inquiryid,
    this.inquiryDate,
    this.inquiryTime,
    this.product,
    this.quantity,
    this.budget,
    this.requestDate,
    this.responseDate,
    this.amount,
    this.timeToSendQuotation,
    this.buyerName,
    this.buyerEmail,
  });

  factory Inquiries.fromRawJson(String str) => Inquiries.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Inquiries.fromJson(Map<String, dynamic> json) => Inquiries(
    inquiryid: json["inquiryid"],
    inquiryDate: json["inquiry_date"],
    inquiryTime: json["inquiry_time"],
    product: json["product"],
    quantity: json["quantity"],
    budget: json["budget"],
    requestDate: json["request_date"],
    responseDate: json["response_date"],
    amount: json["amount"],
    timeToSendQuotation: json["time_to_send_quotation"],
    buyerName: json["buyer_name"],
    buyerEmail: json["buyer_email"],
  );

  Map<String, dynamic> toJson() => {
    "inquiryid": inquiryid,
    "inquiry_date": inquiryDate,
    "inquiry_time": inquiryTime,
    "product": product,
    "quantity": quantity,
    "budget": budget,
    "request_date": requestDate,
    "response_date": responseDate,
    "amount": amount,
    "time_to_send_quotation": timeToSendQuotation,
    "buyer_name": buyerName,
    "buyer_email": buyerEmail,
  };
}
