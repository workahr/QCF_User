import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:namfood/pages/HomeScreen/home_screen.dart';
import 'package:namfood/widgets/custom_text_field.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../services/comFuncService.dart';
import '../../services/nam_food_api_service.dart';
import '../../widgets/heading_widget.dart';
import '../../widgets/sub_heading_widget.dart';
import '../models/homescreen_model.dart';
import '../models/store_list_model.dart';
import '../rating/add_rating_page.dart';
import '../rating/rating_list_page.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final NamFoodApiService apiService = NamFoodApiService();

  int cartItemCount = 0;
  double totalPrice = 0.0;

  @override
  void initState() {
    super.initState();

    getstoredishlist();
  }

  List<StoreDish> storedishlistpage = [];
  List<StoreDish> storedishlistpageAll = [];
  bool isLoading = false;

  // Group the dishes by category
  Map<String, List<StoreDish>> groupedDishes = {};

  Future getstoredishlist() async {
    setState(() {
      isLoading = true;
    });

    try {
      var result = await apiService.getstoredishlist();
      var response = storedishlistmodelFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          storedishlistpage = response.list;
          storedishlistpageAll = storedishlistpage;
          isLoading = false;
          _groupDishesByCategory(); // Group the dishes after fetching
        });
      } else {
        setState(() {
          storedishlistpage = [];
          storedishlistpageAll = [];
          isLoading = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        storedishlistpage = [];
        storedishlistpageAll = [];
        isLoading = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

  // Group the dishes by category
  void _groupDishesByCategory() {
    groupedDishes.clear();

    for (var dish in storedishlistpageAll) {
      if (!groupedDishes.containsKey(dish.category)) {
        groupedDishes[dish.category] = [];
      }
      groupedDishes[dish.category]?.add(dish);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightGrey3,
          title: HeadingWidget(title: "Back"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: HeadingWidget(
                                        title:
                                            'Grill Chicken Arabian Restaurant',
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RatingListPage(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 4.0,
                                                horizontal: 8.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.red,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: AppColors.light,
                                                    size: 16,
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    '4.5',
                                                    style: TextStyle(
                                                      color: AppColors.light,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            SubHeadingWidget(
                                              title: '252K Rating',
                                              fontSize: 14.0,
                                              color: AppColors.red,
                                            ),
                                            DottedLine(
                                              direction: Axis.horizontal,
                                              dashColor: AppColors.red,
                                              lineLength: 80,
                                              dashLength: 2,
                                              dashGapLength: 2,
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SubHeadingWidget(
                                      title: '2.5km • 10mins',
                                      fontSize: 14.0,
                                      color: AppColors.black,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                SubHeadingWidget(
                                  title: 'South Indian Foods',
                                  fontSize: 14.0,
                                  color: AppColors.black,
                                ),
                              ])),
                      Column(
                        children: [
                          DottedLine(
                            direction: Axis.horizontal,
                            dashColor: Color(0xFFE23744),
                            lineLength: MediaQuery.of(context).size.width,
                            dashLength: 2,
                            dashGapLength: 2,
                          ),
                          // Divider(color: Colors.grey[300]),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.red[50],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppAssets.offerimg,
                                  height: 25,
                                  width: 25,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '40% Off • Upto ₹90',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                CustomeTextField(
                  width: MediaQuery.of(context).size.width - 10.0,
                  hint: 'Find your dish',
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.red,
                  ),
                  labelColor: Colors.grey[900],
                  // borderColor: AppColors.primary2,
                  focusBorderColor: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderColor: AppColors.lightGrey3,
                ),
                SizedBox(height: 5),
                isLoading
                    ? Center(
                        child:
                            CircularProgressIndicator()) // Show loading spinner
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: groupedDishes.keys.length,
                        itemBuilder: (context, index) {
                          String category = groupedDishes.keys.elementAt(index);
                          List<StoreDish> dishes = groupedDishes[category]!;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8),
                              HeadingWidget(
                                title: category, // Category name
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              // SizedBox(height: 8),
                              // List the dishes under this category
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: dishes.length,
                                itemBuilder: (context, index) {
                                  final e = dishes[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 8.0),
                                        child: Row(
                                          children: [
                                            Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    e.dishimage.toString(),
                                                    // AppAssets.storeBiriyaniImg,
                                                    width: 120,
                                                    height: 120,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned(
                                                    bottom: -13,
                                                    left: 15,
                                                    right: 15,
                                                    child: Container(
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color:
                                                                AppColors.red,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          color:
                                                              AppColors.light),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.add,
                                                            color:
                                                                AppColors.red,
                                                          ),
                                                          SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          HeadingWidget(
                                                            title: "Add",
                                                            color:
                                                                AppColors.red,
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // SizedBox(
                                                  //   height: 5,
                                                  // ),
                                                  Row(
                                                    children: [
                                                      e.type == "Non-Veg"
                                                          ? Image.asset(
                                                              AppAssets
                                                                  .nonveg_icon,
                                                              width: 20,
                                                              height: 20,
                                                            )
                                                          : Image.asset(
                                                              AppAssets
                                                                  .veg_icon,
                                                              width: 20,
                                                              height: 20,
                                                            ),
                                                      SizedBox(
                                                        width: 3.0,
                                                      ),
                                                      HeadingWidget(
                                                        title: e
                                                            .type, // 'Non-Veg',
                                                        vMargin: 1.0,
                                                        fontSize: 13.0,
                                                      ),
                                                    ],
                                                  ),
                                                  HeadingWidget(
                                                    title: e
                                                        .dishname, // "Chicken Biryani",
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    vMargin: 1.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.star,
                                                          color: Colors.red,
                                                          size: 16),
                                                      SubHeadingWidget(
                                                        title: e
                                                            .rating, // '4.5 (125)',
                                                        vMargin: 1.0,
                                                        color: Colors.black,
                                                      ),
                                                      SubHeadingWidget(
                                                        title: e
                                                            .reviewpersons, // '4.5 (125)',
                                                        vMargin: 1.0,
                                                        color: Colors.black,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(children: [
                                                    Text(
                                                      e.actualprice.toString(),
                                                      //'₹150.0',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    HeadingWidget(
                                                      title: e
                                                          .discountprice, // '₹100.0',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      vMargin: 1.0,
                                                    ),
                                                  ]),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child:
                                                              SubHeadingWidget(
                                                        title: e.description,
                                                        //  'Lorem ipsum dolor sit amet consectetur',
                                                        color: AppColors.black,
                                                        vMargin: 1.0,
                                                      )),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Divider(
                                          height: 1,
                                          thickness: 0.5,
                                          color: AppColors.grey),
                                    ],
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 70.0,
          elevation: 0,
          color: AppColors.light,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubHeadingWidget(
                        title: "1 item",
                        color: AppColors.black,
                      ),
                      HeadingWidget(
                        title: "Price: ₹100.00",
                        color: AppColors.red,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to cart
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          SubHeadingWidget(
                            title: "Go to cart",
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.black, // Background color of the container
            shape: BoxShape.circle, // Makes the container circular
          ),
          child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.noteBookImg,
                    width: 20,
                    height: 20,
                    color: AppColors.light,
                  ),
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 75.0, vertical: 30.0),
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Briyani',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          '3',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Non Veg Starters',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          '3',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Tandoori',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          '2',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Fried Rice & Noodles',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          '1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[800],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text(
                        "Menu",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))
                ],
              )),
        ));
  }
}







// before black menu funtion





// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:namfood/widgets/custom_text_field.dart';

// import '../../constants/app_assets.dart';
// import '../../constants/app_colors.dart';
// import '../../services/comFuncService.dart';
// import '../../services/nam_food_api_service.dart';
// import '../../widgets/heading_widget.dart';
// import '../../widgets/sub_heading_widget.dart';
// import '../models/homescreen_model.dart';
// import '../models/store_list_model.dart';

// class StorePage extends StatefulWidget {
//   const StorePage({super.key});

//   @override
//   _StorePageState createState() => _StorePageState();
// }

// class _StorePageState extends State<StorePage> {
//   final NamFoodApiService apiService = NamFoodApiService();

//   int cartItemCount = 0;
//   double totalPrice = 0.0;

//   void addItemToCart(double itemPrice) {
//     setState(() {
//       cartItemCount++;
//       totalPrice += itemPrice;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();

//     getstoredishlist();
//   }

//   List<StoreDish> storedishlistpage = [];
//   List<StoreDish> storedishlistpageAll = [];
//   bool isLoading = false;

//   Future getstoredishlist() async {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       var result = await apiService.getstoredishlist();
//       var response = storedishlistmodelFromJson(result);
//       if (response.status.toString() == 'SUCCESS') {
//         setState(() {
//           storedishlistpage = response.list;
//           storedishlistpageAll = storedishlistpage;
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           storedishlistpage = [];
//           storedishlistpageAll = [];
//           isLoading = false;
//         });
//         showInSnackBar(context, response.message.toString());
//       }
//     } catch (e) {
//       setState(() {
//         storedishlistpage = [];
//         storedishlistpageAll = [];
//         isLoading = false;
//       });
//       showInSnackBar(context, 'Error occurred: $e');
//     }

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.lightGrey3,
//         title: HeadingWidget(title: "Back"),
//         // automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 // padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15.0),
//                   border: Border.all(color: Colors.grey.shade300),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: HeadingWidget(
//                                       title: 'Grill Chicken Arabian Restaurant',
//                                       fontSize: 22.0,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Column(
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.symmetric(
//                                           vertical: 4.0,
//                                           horizontal: 8.0,
//                                         ),
//                                         decoration: BoxDecoration(
//                                           color: AppColors.red,
//                                           borderRadius:
//                                               BorderRadius.circular(12.0),
//                                         ),
//                                         child: Row(
//                                           children: [
//                                             Icon(
//                                               Icons.star,
//                                               color: AppColors.light,
//                                               size: 16,
//                                             ),
//                                             SizedBox(width: 4),
//                                             Text(
//                                               '4.5',
//                                               style: TextStyle(
//                                                 color: AppColors.light,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//                                       SubHeadingWidget(
//                                         title: '252K Rating',
//                                         fontSize: 14.0,
//                                         color: AppColors.red,
//                                       ),
//                                       DottedLine(
//                                         direction: Axis.horizontal,
//                                         dashColor: AppColors.red,
//                                         lineLength: 80,
//                                         dashLength: 2,
//                                         dashGapLength: 2,
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                               SizedBox(height: 4),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SubHeadingWidget(
//                                     title: '2.5km • 10mins',
//                                     fontSize: 14.0,
//                                     color: AppColors.black,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 4),
//                               SubHeadingWidget(
//                                 title: 'South Indian Foods',
//                                 fontSize: 14.0,
//                                 color: AppColors.black,
//                               ),
//                             ])),
//                     Column(
//                       children: [
//                         DottedLine(
//                           direction: Axis.horizontal,
//                           dashColor: Colors.grey,
//                           lineLength: MediaQuery.of(context).size.width,
//                           dashLength: 2,
//                           dashGapLength: 2,
//                         ),
//                         // Divider(color: Colors.grey[300]),
//                         Container(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 8.0, horizontal: 8.0),
//                           decoration: BoxDecoration(
//                             color: Colors.red[50],
//                             borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(8.0),
//                               bottomRight: Radius.circular(8.0),
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               Image.asset(
//                                 AppAssets.offerimg,
//                                 height: 25,
//                                 width: 25,
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 '40% Off • Upto ₹90',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.red,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16),
//               CustomeTextField(
//                 width: MediaQuery.of(context).size.width - 10.0,
//                 hint: 'Find your dish',
//                 prefixIcon: Icon(
//                   Icons.search,
//                   color: AppColors.red,
//                 ),
//                 labelColor: Colors.grey[900],
//                 // borderColor: AppColors.primary2,
//                 focusBorderColor: AppColors.primary,
//                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                 borderColor: AppColors.lightGrey3,
//               ),
//               SizedBox(height: 5),
//               ListView.builder(
//                   itemCount: storedishlistpage.length,
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     final e = storedishlistpage[index];
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         HeadingWidget(
//                           title: e.category, // 'Briyani',
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16.0, vertical: 8.0),
//                           child: Row(
//                             children: [
//                               Stack(
//                                 clipBehavior: Clip.none,
//                                 children: [
//                                   // Food item image
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     child: Image.asset(
//                                       e.dishimage.toString(),
//                                       // AppAssets.storeBiriyaniImg,
//                                       width: 120,
//                                       height: 120,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   // Positioned Add button at the bottom
//                                   Positioned(
//                                       bottom: -13,
//                                       left: 15,
//                                       right: 15,
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                             border: Border.all(
//                                               color: AppColors.red,
//                                             ),
//                                             borderRadius:
//                                                 BorderRadius.circular(10.0),
//                                             color: AppColors.light),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Icon(
//                                               Icons.add,
//                                               color: AppColors.red,
//                                             ),
//                                             SizedBox(
//                                               width: 5.0,
//                                             ),
//                                             HeadingWidget(
//                                               title: "Add",
//                                               color: AppColors.red,
//                                             )
//                                           ],
//                                         ),
//                                       )),
//                                 ],
//                               ),
//                               SizedBox(width: 16),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     // SizedBox(
//                                     //   height: 5,
//                                     // ),
//                                     Row(
//                                       children: [
//                                         e.type == "Non-Veg"
//                                             ? Image.asset(
//                                                 AppAssets.nonveg_icon,
//                                                 width: 20,
//                                                 height: 20,
//                                               )
//                                             : Image.asset(
//                                                 AppAssets.veg_icon,
//                                                 width: 20,
//                                                 height: 20,
//                                               ),
//                                         SizedBox(
//                                           width: 3.0,
//                                         ),
//                                         HeadingWidget(
//                                           title: e.type, // 'Non-Veg',
//                                           vMargin: 1.0,
//                                           fontSize: 13.0,
//                                         ),
//                                       ],
//                                     ),
//                                     HeadingWidget(
//                                       title: e.dishname, // "Chicken Biryani",
//                                       fontSize: 16.0,
//                                       fontWeight: FontWeight.bold,
//                                       vMargin: 1.0,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Icon(Icons.star,
//                                             color: Colors.red, size: 16),
//                                         SubHeadingWidget(
//                                           title: e.rating, // '4.5 (125)',
//                                           vMargin: 1.0,
//                                           color: Colors.black,
//                                         ),
//                                         SubHeadingWidget(
//                                           title:
//                                               e.reviewpersons, // '4.5 (125)',
//                                           vMargin: 1.0,
//                                           color: Colors.black,
//                                         ),
//                                       ],
//                                     ),
//                                     Row(children: [
//                                       Text(
//                                         e.actualprice.toString(),
//                                         //'₹150.0',
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           decoration:
//                                               TextDecoration.lineThrough,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       HeadingWidget(
//                                         title: e.discountprice, // '₹100.0',
//                                         fontWeight: FontWeight.bold,
//                                         vMargin: 1.0,
//                                       ),
//                                     ]),
//                                     Row(
//                                       children: [
//                                         Expanded(
//                                             child: SubHeadingWidget(
//                                           title: e.description,
//                                           //  'Lorem ipsum dolor sit amet consectetur',
//                                           color: AppColors.black,
//                                           vMargin: 1.0,
//                                         )),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Divider(
//                             height: 1, thickness: 0.5, color: AppColors.grey),
//                       ],
//                     );
//                   }),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         height: 70.0,
//         elevation: 0,
//         color: AppColors.light,
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.all(1.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SubHeadingWidget(
//                       title: "1 item",
//                       color: AppColors.black,
//                     ),
//                     HeadingWidget(
//                       title: "Price: ₹100.00",
//                       color: AppColors.red,
//                     ),
//                   ],
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigate to cart
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                     child: Row(
//                       children: [
//                         SubHeadingWidget(
//                           title: "Go to cart",
//                           color: Colors.white,
//                         ),
//                         //   Icon(Icons.arrow_forward),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: Container(
//           width: 60, // Adjust size as needed
//           height: 60, // Adjust size as needed
//           decoration: BoxDecoration(
//             color: AppColors.black, // Background color of the container
//             shape: BoxShape.circle, // Makes the container circular
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 AppAssets.noteBookImg,
//                 width: 20,
//                 height: 20,
//                 color: AppColors.light,
//               ),
//               HeadingWidget(
//                 title: "Menu",
//                 color: Colors.white,
//                 fontSize: 12.0,
//               )
//             ],
//           )),
//     );
//   }
// }
