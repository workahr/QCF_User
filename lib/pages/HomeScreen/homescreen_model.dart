import 'dart:convert';

AddtoCartPage addtocartPageDataFromJson(String str) =>
    AddtoCartPage.fromJson(json.decode(str));

String addtocartPageDataToJson(AddtoCartPage data) =>
    json.encode(data.toJson());

class AddtoCartPage {
  String status;
  List<AddtoCart> list;
  String code;
  String message;

  AddtoCartPage({
    required this.status,
    required this.list,
    required this.code,
    required this.message,
  });

  factory AddtoCartPage.fromJson(Map<String, dynamic> json) => AddtoCartPage(
        status: json["status"],
        list: List<AddtoCart>.from(
            json["list"].map((x) => AddtoCart.fromJson(x))),
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

class AddtoCart {
  int id;
  String? title;
  String? content;
  String? type;
  String image;
  String? delivery;
  String? deliveryicon;
  String? actualprice;
  String? oldprice;
  String? discount;
  String? star;
  String? plus;
  String? minus;
  int rating;
  String? views;
  int status;
  int active;
  int createdBy;
  DateTime createdDate;
  int? updatedBy;
  DateTime? updatedDate;

  AddtoCart({
    required this.id,
    this.content,
    this.type,
    this.title,
    required this.image,
    this.plus,
    this.minus,
    this.views,
    this.star,
    this.delivery,
    this.deliveryicon,
    this.actualprice,
    this.oldprice,
    this.discount,
    required this.rating,
    required this.status,
    required this.active,
    required this.createdBy,
    required this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory AddtoCart.fromJson(Map<String, dynamic> json) => AddtoCart(
        id: json["id"],
        type: json["type"],
        title: json["title"],
        views: json["views"],
        content: json["content"],
        delivery: json["delivery"],
        deliveryicon: json["deliveryicon"],
        image: json["image"],
        star: json["star"],
        plus: json["plus"],
        minus: json["minus"],
        actualprice: json["actualprice"],
        oldprice: json["oldprice"],
        discount: json["discount"],
        rating: json["rating"],
        status: json["status"],
        active: json["active"],
        createdBy: json["created_by"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedBy: json["updated_by"],
        updatedDate: json["updated_date"] == null
            ? null
            : DateTime.parse(json["updated_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "type": type,
        "title": title,
        "delivery": delivery,
        "deliveryicon": deliveryicon,
        "image": image,
        "plus": plus,
        "minus": minus,
        "views": views,
        "actualprice": actualprice,
        "oldprice": oldprice,
        "discount": discount,
        "rating": rating,
        "status": status,
        "active": active,
        "created_by": createdBy,
        "created_date": createdDate.toIso8601String(),
        "updated_by": updatedBy,
        "updated_date": updatedDate?.toIso8601String(),
      };
}
