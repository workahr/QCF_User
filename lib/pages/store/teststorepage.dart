import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:namfood/pages/HomeScreen/home_screen.dart';
import 'package:namfood/pages/cart/cart_page.dart';
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

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int _quantity = 1;
  bool _showCounter = false;

  void _toggleCounter() {
    setState(() {
      _showCounter = true;
    });
  }

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightGrey3,
          title: HeadingWidget(title: "Back"),
        ),
        body: Container(
          child: _showCounter
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.red), // Customize border color here
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _increment,
                        child: Icon(
                          Icons.add,
                          color: Colors.red, // Customize icon color here
                          size: 20,
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: _decrement,
                      //   child: Icon(
                      //     Icons.remove,
                      //     color: Colors.red, // Customize icon color here
                      //     size: 20,
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          '$_quantity',
                          style: TextStyle(
                            color: Colors.red, // Customize text color here
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _decrement,
                        child: Icon(
                          Icons.remove,
                          color: Colors.red, // Customize icon color here
                          size: 20,
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: _increment,
                      //   child: Icon(
                      //     Icons.add,
                      //     color: Colors.red, // Customize icon color here
                      //     size: 20,
                      //   ),
                      // ),
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: _toggleCounter,
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.red),
                        SizedBox(width: 5.0),
                        Text(
                          "Add",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}




// class MyFloatingActionButton extends StatefulWidget {
//   @override
//   _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
// }

// class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
//   OverlayEntry? _overlayEntry;

//   void _showOverlay(BuildContext context) {
//     _overlayEntry = OverlayEntry(
//       builder: (context) => GestureDetector(
//         onTap: _removeOverlay, // Tapping outside the overlay closes it
//         child: Material(
//           color: Colors.black.withOpacity(0.5),
//           child: Center(
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 75.0, vertical: 30.0),
//               padding: EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(16.0),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Briyani',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                       Text(
//                         '3',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Non Veg Starters',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                       Text(
//                         '3',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Tandoori',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                       Text(
//                         '2',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Fried Rice & Noodles',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                       Text(
//                         '1',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   GestureDetector(
//                     onTap: _removeOverlay, // Close overlay on button tap
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 8.0),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[800],
//                         shape: BoxShape.circle,
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             Icons.close,
//                             color: Colors.white,
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             'Close',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );

//     Overlay.of(context).insert(_overlayEntry!);
//   }

//   void _removeOverlay() {
//     _overlayEntry?.remove();
//     _overlayEntry = null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         FloatingActionButton(
//           onPressed: () => _showOverlay(context),
//           child: Container(
//             width: 70,
//             height: 70,
//             decoration: BoxDecoration(
//               color: AppColors.black,
//               shape: BoxShape.circle,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(1.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     AppAssets.noteBookImg,
//                     width: 20,
//                     height: 20,
//                     color: AppColors.light,
//                   ),
//                   Text(
//                     "Menu",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
