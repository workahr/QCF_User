// drivers_data.dart

import 'dart:convert';

import 'package:namfood/constants/app_assets.dart';

Future getAddRatingJsonData() async {
  var result = {
    "status": "SUCCESS",
    "list": [
      {
        "id": 1,
        "store_name":"Grill Chicken Arabian Restaurant",
        "store_rating": 4,
        "person_rating": 3,
        "qty": "Qty-5",
        "dishimage": "assets/images/cart_biriyani_img.png",
        "dishes": [
          {
            "name": "Chicken Biriyani",
            "rating": 3
          },
          {
            "name": "Chicken Kabab",
            "rating": 4
          },
          {
            "name": "Mutton Biriyani",
            "rating": 5
          }
          ],
        "delivery_person": "Barani",
        "status": 1,
        "active": 1,
        "created_by": 101,
        "created_date": null,
        "updated_by": 102,
        "updated_date": null
      },
    ],
    "code": "206",
    "message": "Listed Successfully."
  };

  return result;
}
