Future getAddtoCartPageJsonData() async {
  var result = {
    "status": "SUCCESS",
    "code": "200",
    "message": "Listed Successfully",
    "list": [
      {
        "id": 1,
        "type": "Fruit",
        "title": "Sweet Young Coc..",
        "image": 'assets/images/c_sweetpotato.png',
        "views": "(89 Views)",
        "plus": "images/plus.png",
        "minus": "images/minus.png",
        "star": "images/star.png",
        "singletotal": "AED90.0",
        "actualprice": "AED90.0",
        "oldprice": "AED20.0",
        "discount": "20% OFF  DISCOUNT",
        "deliveryicon": "assets/images/delivery.png",
        "delivery": "FREE DELIVERY",
        "rating": 4,
        "status": 1,
        "active": 1,
        "created_by": 101,
        "created_date": DateTime.now().toIso8601String(),
        "updated_by": 102,
        "updated_date": DateTime.now().toIso8601String(),
      },
    ]
  };

  return result;
}
