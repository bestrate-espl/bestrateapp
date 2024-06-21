import 'dart:convert';

class BuyerInquiriesDetailsModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? base;
  final Inquiry? inquiry;
  final List<Pending>? pending;
  final String? errorMsg;
  final bool? isError;

  BuyerInquiriesDetailsModel({
    this.statusCode,
    this.status,
    this.message,
    this.base,
    this.inquiry,
    this.pending,
    this.errorMsg,
    this.isError
  });

  factory BuyerInquiriesDetailsModel.fromRawJson(String str) => BuyerInquiriesDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BuyerInquiriesDetailsModel.fromJson(Map<String, dynamic> json) => BuyerInquiriesDetailsModel(
    statusCode: json["status_code"],
    status: json["status"],
    message: json["message"],
    base: json["base"],
    inquiry: json["inquiry"] == null ? null : Inquiry.fromJson(json["inquiry"]),
    pending: json["pending"] == null ? [] : List<Pending>.from(json["pending"]!.map((x) => Pending.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "base": base,
    "inquiry": inquiry?.toJson(),
    "pending": pending == null ? [] : List<dynamic>.from(pending!.map((x) => x.toJson())),
  };
}

class Inquiry {
  final String? keyword;
  final String? quantity;
  final String? budgetStart;
  final String? budgetEnd;
  final String? description;
  final String? inquiryStatus;
  final String? inquiryDate;
  final dynamic inquiryTime;
  final List<dynamic>? inquiryFile;

  Inquiry({
    this.keyword,
    this.quantity,
    this.budgetStart,
    this.budgetEnd,
    this.description,
    this.inquiryStatus,
    this.inquiryDate,
    this.inquiryTime,
    this.inquiryFile,
  });

  factory Inquiry.fromRawJson(String str) => Inquiry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Inquiry.fromJson(Map<String, dynamic> json) => Inquiry(
    keyword: json["keyword"],
    quantity: json["quantity"],
    budgetStart: json["budget_start"],
    budgetEnd: json["budget_end"],
    description: json["description"],
    inquiryStatus: json["inquiry_status"],
    inquiryDate: json["inquiry_date"],
    inquiryTime: json["inquiry_time"],
    inquiryFile: json["inquiry_file"] == null ? [] : List<dynamic>.from(json["inquiry_file"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "keyword": keyword,
    "quantity": quantity,
    "budget_start": budgetStart,
    "budget_end": budgetEnd,
    "description": description,
    "inquiry_status": inquiryStatus,
    "inquiry_date": inquiryDate,
    "inquiry_time": inquiryTime,
    "inquiry_file": inquiryFile == null ? [] : List<dynamic>.from(inquiryFile!.map((x) => x)),
  };
}

class Pending {
  final int? id;
  final String? sellerId;
  final String? firstName;
  final String? lastName;
  final dynamic businessName;
  final String? quotationFiles;
  final String? quotedPrice;

  Pending({
    this.id,
    this.sellerId,
    this.firstName,
    this.lastName,
    this.businessName,
    this.quotationFiles,
    this.quotedPrice,
  });

  factory Pending.fromRawJson(String str) => Pending.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pending.fromJson(Map<String, dynamic> json) => Pending(
    id: json["id"],
    sellerId: json["seller_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    businessName: json["business_name"],
    quotationFiles: json["quotation_files"],
    quotedPrice: json["quoted_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seller_id": sellerId,
    "first_name": firstName,
    "last_name": lastName,
    "business_name": businessName,
    "quotation_files": quotationFiles,
    "quoted_price": quotedPrice,
  };
}
