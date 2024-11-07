// drivers_data.dart

import 'dart:convert';


Future getStoreListJsonData() async {
  var result = {
    "status": "SUCCESS",
    "code": "200",
    "message": "Listed Successfully",
    "list": [
      {
        "id": 1,
        "username": "driver1",
        "password": "pass123",
        "fullname": "John Doe",
        "email": "john.doe@example.com",
        "mobile": "1234567890",
        "role": 2,
        "reg_otp": "1234",
        "status": 1,
        "active": 1,
        "created_by": 101,
        "created_date": DateTime.now().toIso8601String(),
        "updated_by": 102,
        "updated_date": DateTime.now().toIso8601String(),
        "user_id": 1001,
        "vehicle_id": 201,
        "license_number": "XYZ123456",
        "license_expiry": DateTime(2025, 12, 31).toIso8601String(),
        "address": "123 Main St, City",
      },
      {
        "id": 2,
        "username": "driver2",
        "password": "pass123",
        "fullname": "John Doe",
        "email": "john.doe@example.com",
        "mobile": "1234567890",
        "role": 2,
        "reg_otp": "1234",
        "status": 1,
        "active": 1,
        "created_by": 101,
        "created_date": DateTime.now().toIso8601String(),
        "updated_by": 102,
        "updated_date": DateTime.now().toIso8601String(),
        "user_id": 1002,
        "vehicle_id": 202,
        "license_number": "XYZ123456",
        "license_expiry": DateTime(2025, 12, 31).toIso8601String(),
        "address": "123 Main St, City",
      }
    ]
  };

  return result;
}
