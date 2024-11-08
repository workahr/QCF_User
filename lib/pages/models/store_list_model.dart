// To parse this JSON data, do
//
//     final driverListData = driverListDataFromJson(jsonString);

import 'dart:convert';

StoreListData storeListDataFromJson(String str) =>
    StoreListData.fromJson(json.decode(str));

String storeListDataToJson(StoreListData data) => json.encode(data.toJson());

class StoreListData {
  String status;
  List<StoreList> list;
  String code;
  String message;

  StoreListData({
    required this.status,
    required this.list,
    required this.code,
    required this.message,
  });

  factory StoreListData.fromJson(Map<String, dynamic> json) => StoreListData(
        status: json["status"],
        list: List<StoreList>.from(
            json["list"].map((x) => StoreList.fromJson(x))),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "code": code,
        "message": message,
      };
}

class StoreList {
  int id;
  String username;
  String password;
  String fullname;
  String email;
  String mobile;
  int role;
  String? regOtp;
  int status;
  int active;
  int createdBy;
  DateTime createdDate;
  int? updatedBy;
  DateTime? updatedDate;
  int userId;
  int vehicleId;
  String licenseNumber;
  DateTime licenseExpiry;
  String address;

  StoreList({
    required this.id,
    required this.username,
    required this.password,
    required this.fullname,
    required this.email,
    required this.mobile,
    required this.role,
    this.regOtp,
    required this.status,
    required this.active,
    required this.createdBy,
    required this.createdDate,
    this.updatedBy,
    this.updatedDate,
    required this.userId,
    required this.vehicleId,
    required this.licenseNumber,
    required this.licenseExpiry,
    required this.address,
  });

  factory StoreList.fromJson(Map<String, dynamic> json) => StoreList(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        fullname: json["fullname"],
        email: json["email"],
        mobile: json["mobile"],
        role: json["role"],
        regOtp: json["reg_otp"],
        status: json["status"],
        active: json["active"],
        createdBy: json["created_by"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedBy: json["updated_by"],
        updatedDate: json["updated_date"] == null
            ? null
            : DateTime.parse(json["updated_date"]),
        userId: json["user_id"],
        vehicleId: json["vehicle_id"],
        licenseNumber: json["license_number"],
        licenseExpiry: DateTime.parse(json["license_expiry"]),
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "fullname": fullname,
        "email": email,
        "mobile": mobile,
        "role": role,
        "reg_otp": regOtp,
        "status": status,
        "active": active,
        "created_by": createdBy,
        "created_date": createdDate.toIso8601String(),
        "updated_by": updatedBy,
        "updated_date": updatedDate?.toIso8601String(),
        "user_id": userId,
        "vehicle_id": vehicleId,
        "license_number": licenseNumber,
        "license_expiry":
            "${licenseExpiry.year.toString().padLeft(4, '0')}-${licenseExpiry.month.toString().padLeft(2, '0')}-${licenseExpiry.day.toString().padLeft(2, '0')}",
        "address": address,
      };
}
