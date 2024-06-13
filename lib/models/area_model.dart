import 'dart:convert';

class AreaModel {
  final int? statusCode;
  final bool? status;
  final List<AreaData>? data;
  final String? errorMsg;
  final bool? isError;

  AreaModel({
    this.statusCode,
    this.status,
    this.data,
    this.errorMsg,
    this.isError
  });

  factory AreaModel.fromRawJson(String str) => AreaModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
    statusCode: json["status_code"],
    status: json["status"],
    data: json["data"] == null ? [] : List<AreaData>.from(json["data"]!.map((x) => AreaData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AreaData {
  final int? id;
  final String? location;
  final String? pincode;
  final States? state;
  final District? district;
  final dynamic createdAt;
  final dynamic updatedAt;

  AreaData({
    this.id,
    this.location,
    this.pincode,
    this.state,
    this.district,
    this.createdAt,
    this.updatedAt,
  });

  factory AreaData.fromRawJson(String str) => AreaData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AreaData.fromJson(Map<String, dynamic> json) => AreaData(
    id: json["id"],
    location: json["location"],
    pincode: json["pincode"],
    state: stateValues.map[json["state"]]!,
    district: districtValues.map[json["district"]]!,
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "location": location,
    "pincode": pincode,
    "state": stateValues.reverse[state],
    "district": districtValues.reverse[district],
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

enum District {
  PUNE
}

final districtValues = EnumValues({
  "Pune": District.PUNE
});

enum States {
  MAHARASHTRA
}

final stateValues = EnumValues({
  "Maharashtra": States.MAHARASHTRA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
