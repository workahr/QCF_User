import 'package:flutter/material.dart';
import 'package:namfood/constants/app_assets.dart';
import 'package:namfood/pages/models/homescreen_model.dart';
import 'package:namfood/widgets/custom_text_field.dart';
import 'package:namfood/widgets/heading_widget.dart';
import 'package:namfood/widgets/sub_heading_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../../constants/app_colors.dart';
import '../../services/comFuncService.dart';
import '../../services/nam_food_api_service.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../models/home_carouseldata_model.dart';
import 'home_screen1.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NamFoodApiService apiService = NamFoodApiService();

  @override
  void initState() {
    super.initState();
    gethomecarousel();
    getdashbordlist();
  }

  //AddtoCart
  List<dashboardlist> dashlistpage = [];
  List<dashboardlist> dashlistpageAll = [];
  bool isLoading = false;

  Future getdashbordlist() async {
    setState(() {
      isLoading = true;
    });

    try {
      var result = await apiService.getdashbordlist();
      var response = dashboardlistmodelFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          dashlistpage = response.list;
          dashlistpageAll = dashlistpage;
          isLoading = false;
        });
      } else {
        setState(() {
          dashlistpage = [];
          dashlistpageAll = [];
          isLoading = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        dashlistpage = [];
        dashlistpageAll = [];
        isLoading = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

  //Carousel
  List<carousels> carouselpage = [];
  List<carousels> carouselpageAll = [];
  bool isLoading2 = false;

  Future gethomecarousel() async {
    setState(() {
      isLoading2 = true;
    });

    try {
      var result = await apiService.gethomecarousel();
      var response = homecarouselDataFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          carouselpage = response.list;
          carouselpageAll = carouselpage;
          isLoading2 = false;
        });
      } else {
        setState(() {
          carouselpage = [];
          carouselpageAll = [];
          isLoading2 = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        carouselpage = [];
        carouselpageAll = [];
        isLoading2 = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFE23744),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(top: 10, bottom: 1),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(21, 21, 21, 14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: Colors.white),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current location',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "No.132 St, New York",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.arrow_drop_down,
                                        color: Colors.white),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications_outlined,
                            color: Colors.white),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeScreen1()));
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 11),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.15,
                      child: CustomeTextField(
                        hint: "Restaurant name or dish",
                        prefixIcon:
                            Icon(Icons.search, color: Color(0xFFE23744)),
                        boxColor: Colors.white,
                        borderColor: Colors.white,
                        focusBorderColor: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        boxRadius: BorderRadius.circular(10),
                        hintColor: const Color.fromARGB(255, 94, 93, 93),
                        labelColor: const Color.fromARGB(255, 103, 103, 103),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(21, 23, 21, 15),
                    child: Column(
                      children: [
                        if (carouselpage
                            .isNotEmpty) // Check if list is not empty
                          CarouselSlider.builder(
                            itemCount: carouselpage.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) {
                              final e = carouselpage[itemIndex];
                              return ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: Image.asset(
                                  e.image,
                                  fit: BoxFit.fill,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return Image.asset(''); // Fallback image
                                  },
                                ),
                              );
                            },
                            options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              aspectRatio: 13.2 / 6,
                              viewportFraction: 1.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                          ),
                        SizedBox(height: 16),
                        if (carouselpage
                            .isNotEmpty) // Show DotsIndicator only if list is not empty
                          DotsIndicator(
                            dotsCount: carouselpage.length,
                            position: currentIndex,
                            decorator: DotsDecorator(
                              color: const Color.fromARGB(255, 216, 216, 216),
                              activeColor: Color(0xFFE23744),
                              size: const Size.square(8.0),
                              activeSize: const Size(12.0, 8.0),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(21, 0, 0, 5),
                    child: HeadingWidget(
                      title: "Restaurant Explore",
                      fontSize: 17.0,
                    ),
                  ),
                  ListView.builder(
                    itemCount: dashlistpage.length,
                    shrinkWrap:
                        true, // Let the list take only as much space as needed
                    physics:
                        NeverScrollableScrollPhysics(), // Disable scrolling for ListView
                    itemBuilder: (context, index) {
                      final e = dashlistpage[index];
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 18, 5),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Color(0xFFEEEEEE),
                                width: 0.2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 196, 195, 195)
                                      .withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          AppAssets.foodimg,
                                          height: 150,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10),
                                                topLeft: Radius.circular(10)),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              e.type == "Non-Veg"
                                                  ? Image.asset(
                                                      AppAssets.nonveg_icon,
                                                      width: 14,
                                                      height: 14)
                                                  : Image.asset(
                                                      AppAssets.veg_icon,
                                                      width: 14,
                                                      height: 14),
                                              SizedBox(width: 4),
                                              HeadingWidget(
                                                title: e.type,
                                                color: e.type == "Non-Veg"
                                                    ? Color(0xFFEF4848)
                                                    : Colors.green,
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: Icon(Icons.favorite_border,
                                            color: Colors.white),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        left: 8,
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                HeadingWidget(
                                                  title: e.title,
                                                  //  'Grill Chicken Arabian \nRestaurant',
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 21,
                                        right: 12,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE23744),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: Colors.white,
                                                  size: 16),
                                              SizedBox(width: 4),
                                              SubHeadingWidget(
                                                  title: e.reviews, // ' 4.5 ',
                                                  color: Colors.white),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(AppAssets.offerimg),
                                            SizedBox(width: 4),
                                            SubHeadingWidget(
                                              title:
                                                  "${e.offerpercentage}% off", //'40% Off ,
                                              color: Colors.black87,
                                            ),
                                            SubHeadingWidget(
                                              title:
                                                  "-Upto ₹${e.offerupto}", // Upto ₹90',
                                              color: Colors.black87,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SubHeadingWidget(
                                                title:
                                                    " ${e.km} Km - ", //'2.5km',
                                                color: Colors.black),
                                            SizedBox(width: 3),
                                            SubHeadingWidget(
                                                title: e.time, //'10mins',
                                                color: Colors.black),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






// Before Json





// import 'package:flutter/material.dart';
// import 'package:namfood/constants/app_assets.dart';
// import 'package:namfood/pages/models/homescreen_model.dart';
// import 'package:namfood/widgets/custom_text_field.dart';
// import 'package:namfood/widgets/heading_widget.dart';
// import 'package:namfood/widgets/sub_heading_widget.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import '../../constants/app_colors.dart';
// import '../../services/comFuncService.dart';
// import '../../services/nam_food_api_service.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// import '../models/home_carouseldata_model.dart';
// import 'home_screen1.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final NamFoodApiService apiService = NamFoodApiService();

//   @override
//   void initState() {
//     super.initState();
//     gethomecarousel();
//     getaddtocart();
//   }

//   //AddtoCart
//   List<AddtoCart> addcartpage = [];
//   List<AddtoCart> addcartpageAll = [];
//   bool isLoading = false;

//   Future getaddtocart() async {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       var result = await apiService.getaddtocart();
//       var response = addtocartPageDataFromJson(result);
//       if (response.status.toString() == 'SUCCESS') {
//         setState(() {
//           addcartpage = response.list;
//           addcartpageAll = addcartpage;
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           addcartpage = [];
//           addcartpageAll = [];
//           isLoading = false;
//         });
//         showInSnackBar(context, response.message.toString());
//       }
//     } catch (e) {
//       setState(() {
//         addcartpage = [];
//         addcartpageAll = [];
//         isLoading = false;
//       });
//       showInSnackBar(context, 'Error occurred: $e');
//     }

//     setState(() {});
//   }

//   //Carousel
//   List<carousels> carouselpage = [];
//   List<carousels> carouselpageAll = [];
//   bool isLoading2 = false;

//   Future gethomecarousel() async {
//     setState(() {
//       isLoading2 = true;
//     });

//     try {
//       var result = await apiService.gethomecarousel();
//       var response = homecarouselDataFromJson(result);
//       if (response.status.toString() == 'SUCCESS') {
//         setState(() {
//           carouselpage = response.list;
//           carouselpageAll = carouselpage;
//           isLoading2 = false;
//         });
//       } else {
//         setState(() {
//           carouselpage = [];
//           carouselpageAll = [];
//           isLoading2 = false;
//         });
//         showInSnackBar(context, response.message.toString());
//       }
//     } catch (e) {
//       setState(() {
//         carouselpage = [];
//         carouselpageAll = [];
//         isLoading2 = false;
//       });
//       showInSnackBar(context, 'Error occurred: $e');
//     }

//     setState(() {});
//   }

//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//               decoration: BoxDecoration(
//                 color: Color(0xFFE23744),
//                 borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(20),
//                 ),
//               ),
//               padding: EdgeInsets.only(top: 20, bottom: 1),
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(21, 21, 21, 21),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Row(
//                             children: [
//                               Icon(Icons.location_on_outlined,
//                                   color: Colors.white),
//                               SizedBox(width: 8),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Current location',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         "No.132 St, New York",
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       Icon(Icons.arrow_drop_down,
//                                           color: Colors.white),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.notifications_outlined,
//                               color: Colors.white),
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (_) => HomeScreen1()));
//                           },
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     SizedBox(
//                         width: MediaQuery.of(context).size.width / 1.15,
//                         child: CustomeTextField(
//                           hint: "Restaurant name or dish",
//                           prefixIcon: Icon(
//                             Icons.search,
//                             color: Color(0xFFE23744),
//                           ),
//                           boxColor: Colors.white,
//                           borderColor: Colors.white,
//                           focusBorderColor: Colors.blue,
//                           borderRadius: BorderRadius.circular(10),
//                           contentPadding: EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 12),
//                           boxRadius: BorderRadius.circular(10),
//                           hintColor: const Color.fromARGB(255, 94, 93, 93),
//                           labelColor: const Color.fromARGB(255, 103, 103, 103),
//                         ))
//                   ],
//                 ),
//               )),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(21, 23, 21, 15),
//                     child: Column(
//                       children: [
//                         CarouselSlider.builder(
//                           carouselController: CarouselSliderController(),
//                           itemCount: carouselpage.length,
//                           itemBuilder: (BuildContext context, int itemIndex,
//                               int pageViewIndex) {
//                             final e = carouselpage[itemIndex];
//                             return ClipRRect(
//                               clipBehavior: Clip.antiAlias,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10.0)),
//                               child: Image.asset(e.image, fit: BoxFit.fill,
//                                   errorBuilder: (BuildContext context,
//                                       Object exception,
//                                       StackTrace? stackTrace) {
//                                 return Image.asset(
//                                   '',
//                                 );
//                               }),
//                             );
//                           },
//                           options: CarouselOptions(
//                             autoPlay: true,
//                             enlargeCenterPage: true,
//                             aspectRatio: 13.2 / 6,
//                             viewportFraction: 1.0,
//                             onPageChanged: (index, reason) {
//                               setState(() {
//                                 currentIndex = index;
//                               });
//                             },
//                             initialPage: 0,
//                             scrollDirection: Axis.horizontal,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 16,
//                         ),
//                         DotsIndicator(
//                           dotsCount: 4,
//                           position: currentIndex,
//                           decorator: DotsDecorator(
//                             color: const Color.fromARGB(255, 216, 216, 216),
//                             activeColor: Color(0xFFE23744),
//                             size: const Size.square(8.0),
//                             activeSize: const Size(12.0, 8.0),
//                             activeShape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5.0),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(21, 0, 0, 12),
//                     child: HeadingWidget(
//                       title: "Restaurant Explore",
//                       fontSize: 17,
//                     ),
//                   ),
//                   ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                     itemCount: 3,
//                     itemBuilder: (context, index) {
//                       return Container(
//                           margin: EdgeInsets.only(bottom: 16),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.2),
//                                 spreadRadius: 2,
//                                 blurRadius: 8,
//                                 offset: Offset(0, 4),
//                               ),
//                             ],
//                           ),
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             elevation: 0,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Stack(
//                                   children: [
//                                     ClipRRect(
//                                       borderRadius: BorderRadius.circular(12),
//                                       child: Image.asset(
//                                         AppAssets.foodimg,
//                                         height: 150,
//                                         width: double.infinity,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     Positioned(
//                                       child: Container(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 7, vertical: 4),
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.only(
//                                               bottomRight: Radius.circular(10),
//                                               topLeft: Radius.circular(10)),
//                                         ),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Image.asset(
//                                               AppAssets.nonveg_icon,
//                                               width: 14,
//                                               height: 14,
//                                             ),
//                                             SizedBox(width: 4),
//                                             HeadingWidget(
//                                               title: 'Non-Veg',
//                                               color: Color(0xFFEF4848),
//                                               fontSize: 11,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       top: 8,
//                                       right: 8,
//                                       child: Icon(
//                                         Icons.favorite_border,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     Positioned(
//                                         bottom: 8,
//                                         left: 8,
//                                         child: Row(
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 HeadingWidget(
//                                                   title:
//                                                       'Grill Chicken Arabian \nRestaurant',
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.white,
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         )),
//                                     Positioned(
//                                       bottom: 21,
//                                       right: 12,
//                                       child: Container(
//                                         padding:
//                                             EdgeInsets.symmetric(horizontal: 8),
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: Color(0xFFE23744),
//                                           borderRadius:
//                                               BorderRadius.circular(16),
//                                         ),
//                                         child: Row(
//                                           children: [
//                                             Icon(Icons.star,
//                                                 color: Colors.white, size: 16),
//                                             SizedBox(width: 4),
//                                             SubHeadingWidget(
//                                               title: ' 4.5 ',
//                                               color: Colors.white,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Image.asset(AppAssets.offerimg),
//                                           SizedBox(width: 4),
//                                           SubHeadingWidget(
//                                             title: '40% Off - Upto ₹90',
//                                             color: Colors.black87,
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           SubHeadingWidget(
//                                             title: '2.5km',
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(width: 16),
//                                           SubHeadingWidget(
//                                             title: '10mins',
//                                             color: Colors.black,
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ));
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

