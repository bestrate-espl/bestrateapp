import 'dart:convert';

class BuyerInquiriesDetailsModel {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? base;
  final Inquiry? inquiry;
  final List<Accepted>? allInquiries;
  final List<Accepted>? accepted;
  final List<dynamic>? rejected;
  final List<QuotationFileElement>? quotationFiles;
  final String? errorMsg;
  final bool? isError;

  BuyerInquiriesDetailsModel({
    this.statusCode,
    this.status,
    this.message,
    this.base,
    this.inquiry,
    this.allInquiries,
    this.accepted,
    this.rejected,
    this.quotationFiles,
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
    allInquiries: json["all_inquiries"] == null ? [] : List<Accepted>.from(json["all_inquiries"]!.map((x) => Accepted.fromJson(x))),
    accepted: json["accepted"] == null ? [] : List<Accepted>.from(json["accepted"]!.map((x) => Accepted.fromJson(x))),
    rejected: json["rejected"] == null ? [] : List<dynamic>.from(json["rejected"]!.map((x) => x)),
    quotationFiles: json["quotation_files"] == null ? [] : List<QuotationFileElement>.from(json["quotation_files"]!.map((x) => QuotationFileElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "base": base,
    "inquiry": inquiry?.toJson(),
    "all_inquiries": allInquiries == null ? [] : List<dynamic>.from(allInquiries!.map((x) => x.toJson())),
    "accepted": accepted == null ? [] : List<dynamic>.from(accepted!.map((x) => x.toJson())),
    "rejected": rejected == null ? [] : List<dynamic>.from(rejected!.map((x) => x)),
    "quotation_files": quotationFiles == null ? [] : List<dynamic>.from(quotationFiles!.map((x) => x.toJson())),
  };
}

class Accepted {
  final int? id;
  final String? sellerId;
  final String? buyerId;
  final String? inqueryId;
  final String? keywordId;
  final String? amount;
  final String? inqueryStatus;
  final dynamic status;
  final DateTime? responseDate;
  final String? inquiryTime;
  final String? quotationTimeStart;
  final String? timer;
  final String? quotationTimeEnd;
  final String? details;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Seller? seller;

  Accepted({
    this.id,
    this.sellerId,
    this.buyerId,
    this.inqueryId,
    this.keywordId,
    this.amount,
    this.inqueryStatus,
    this.status,
    this.responseDate,
    this.inquiryTime,
    this.quotationTimeStart,
    this.timer,
    this.quotationTimeEnd,
    this.details,
    this.createdAt,
    this.updatedAt,
    this.seller,
  });

  factory Accepted.fromRawJson(String str) => Accepted.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Accepted.fromJson(Map<String, dynamic> json) => Accepted(
    id: json["id"],
    sellerId: json["seller_id"],
    buyerId: json["buyer_id"],
    inqueryId: json["inquery_id"],
    keywordId: json["keyword_id"],
    amount: json["amount"],
    inqueryStatus: json["inquery_status"],
    status: json["status"],
    responseDate: json["response_date"] == null ? null : DateTime.parse(json["response_date"]),
    inquiryTime: json["inquiry_time"],
    quotationTimeStart: json["quotation_time_start"],
    timer: json["timer"],
    quotationTimeEnd: json["quotation_time_end"],
    details: json["details"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seller_id": sellerId,
    "buyer_id": buyerId,
    "inquery_id": inqueryId,
    "keyword_id": keywordId,
    "amount": amount,
    "inquery_status": inqueryStatus,
    "status": status,
    "response_date": "${responseDate!.year.toString().padLeft(4, '0')}-${responseDate!.month.toString().padLeft(2, '0')}-${responseDate!.day.toString().padLeft(2, '0')}",
    "inquiry_time": inquiryTime,
    "quotation_time_start": quotationTimeStart,
    "timer": timer,
    "quotation_time_end": quotationTimeEnd,
    "details": details,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "seller": seller?.toJson(),
  };
}

class Seller {
  final int? id;
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
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Seller({
    this.id,
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
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Seller.fromRawJson(String str) => Seller.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
    id: json["id"],
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
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Inquiry {
  final String? keyword;
  final String? quantity;
  final String? budgetStart;
  final String? budgetEnd;
  final String? description;
  final String? inquiryStatus;
  final List<QuotationFileElement>? inquiryFile;

  Inquiry({
    this.keyword,
    this.quantity,
    this.budgetStart,
    this.budgetEnd,
    this.description,
    this.inquiryStatus,
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
    inquiryFile: json["inquiry_file"] == null ? [] : List<QuotationFileElement>.from(json["inquiry_file"]!.map((x) => QuotationFileElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "keyword": keyword,
    "quantity": quantity,
    "budget_start": budgetStart,
    "budget_end": budgetEnd,
    "description": description,
    "inquiry_status": inquiryStatus,
    "inquiry_file": inquiryFile == null ? [] : List<dynamic>.from(inquiryFile!.map((x) => x.toJson())),
  };
}

class QuotationFileElement {
  final int? id;
  final String? inquiryId;
  final String? file;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? sellerquerysId;

  QuotationFileElement({
    this.id,
    this.inquiryId,
    this.file,
    this.createdAt,
    this.updatedAt,
    this.sellerquerysId,
  });

  factory QuotationFileElement.fromRawJson(String str) => QuotationFileElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuotationFileElement.fromJson(Map<String, dynamic> json) => QuotationFileElement(
    id: json["id"],
    inquiryId: json["inquiry_id"],
    file: json["file"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    sellerquerysId: json["sellerquerys_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "inquiry_id": inquiryId,
    "file": file,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "sellerquerys_id": sellerquerysId,
  };
}
