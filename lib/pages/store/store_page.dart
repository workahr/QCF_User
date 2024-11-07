import 'package:flutter/material.dart';
import 'package:namfood/widgets/custom_text_field.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../widgets/heading_widget.dart';
import '../../widgets/sub_heading_widget.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int cartItemCount = 0;
  double totalPrice = 0.0;

  void addItemToCart(double itemPrice) {
    setState(() {
      cartItemCount++;
      totalPrice += itemPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadingWidget(title: "Back"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                 decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: HeadingWidget(
                           title:  'Grill Chicken Arabian Restaurant',
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            
                          ),
                        ),
                        Column(
                          children: [
                             Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(12.0),
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
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        SizedBox(height: 5.0,),
                        
                       SubHeadingWidget(
                         title:  '252K Rating',
                        fontSize: 14,
                        color: AppColors.red,
                    ),
                          ],

                        )
                       
                      ],
                    ),
                    SizedBox(height: 4),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          SubHeadingWidget(
                         title:  '2.5km • 10mins',
                        fontSize: 14,
                        color: AppColors.black,
                    ),



                      ],
                    ),
                  
                    SizedBox(height: 4),
                     SubHeadingWidget(
                        title:   'South Indian Foods',
                        fontSize: 14,
                        color: AppColors.grey,
                    ),
                    Divider(color: Colors.grey[300]),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(8.0),
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
                ),
              ),
              SizedBox(height: 16),

              CustomeTextField(
                  width: MediaQuery.of(context).size.width - 10.0,
                 hint: 'Find your dish',
                  prefixIcon: Icon(Icons.search, color: AppColors.red,),
               labelColor: AppColors.primary,
                    // borderColor: AppColors.primary2,
                    focusBorderColor: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderColor: AppColors.lightGrey3,
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'Find your dish',
              //     prefixIcon: Icon(Icons.search),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(16.0),
              //     ),
              //   ),
              // ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingWidget(title: 'Briyani', fontSize: 20.0, fontWeight: FontWeight.bold,),
                  FoodItemWidget(
                    name: 'Chicken Biryani',
                    rating: 4.5,
                    price: 150.0,
                    discountPrice: 100.0,
                    imageUrl: AppAssets.storeBiriyaniImg, // Add your image path here
                    onAdd: addItemToCart,
                  ),
                  Divider(height: 1, thickness: 0.5, color: AppColors.grey),
                  FoodItemWidget(
                    name: 'Chicken Kebab',
                    rating: 4.5,
                    price: 200.0,
                    discountPrice: 150.0,
                    imageUrl: AppAssets.storeKababImg, // Add your image path here
                    onAdd: addItemToCart,
                  ),
                  Divider(height: 1, thickness: 0.5, color: AppColors.grey),
                  HeadingWidget(title: 'Non Veg Starters',fontSize: 20.0, fontWeight: FontWeight.bold,),
                  FoodItemWidget(
                    name: 'Chicken Kebab',
                    rating: 4.5,
                    price: 200.0,
                    discountPrice: 150.0,
                    imageUrl: AppAssets.storeKababImg, // Add your image path here
                    onAdd: addItemToCart,
                  ),
                  Divider(height: 1, thickness: 0.5, color: AppColors.grey),
                  FoodItemWidget(
                    name: 'Chicken Biryani',
                    rating: 4.5,
                    price: 150.0,
                    discountPrice: 100.0,
                    imageUrl: AppAssets.storeBiriyaniImg, // Add your image path here
                    onAdd: addItemToCart,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: BottomAppBar(
        height: 100.0,
        elevation: 0,
        color: AppColors.light,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeadingWidget(
                      title: "1 item",
                      color: AppColors.red,
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Row(
                      children: [
                        SubHeadingWidget(
                          title: "Go to cart",
                          color: Colors.white,
                        ),
                        Icon(Icons.arrow_forward),
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
          width: 80,  // Adjust size as needed
          height: 80, // Adjust size as needed
          decoration: BoxDecoration(
            color: AppColors.black, // Background color of the container
            shape: BoxShape.circle, // Makes the container circular
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.noteBookImg,
                  width: 25,
                  height: 25,
                  color: AppColors.light,),

          HeadingWidget(title: "Menu",color: Colors.white,)

            ],
          )
        
        ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String title;

  const CategorySection({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class FoodItemWidget extends StatelessWidget {
  final String name;
  final double rating;
  final double price;
  final double discountPrice;
  final String imageUrl;
  final Function(double) onAdd;

  const FoodItemWidget({
    required this.name,
    required this.rating,
    required this.price,
    required this.discountPrice,
    required this.imageUrl,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          // Use Stack for image and button overlay
          Stack(
             clipBehavior: Clip.none,
            children: [
              // Food item image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageUrl,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              // Positioned Add button at the bottom
              Positioned(
                 bottom: -17,
                left: 8,
                right: 8,
                child: 
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.red,),
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.light
                  ),
                  child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: AppColors.red,),

                      SizedBox(width: 5.0,),

                      HeadingWidget(title: "Add", color: AppColors.red,)
                    ],
                  ),
                )
              
              ),
            ],
          ),
          SizedBox(width: 16),
          // Details section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Image.asset(
                 AppAssets.nonveg_icon,
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 3.0,),
                HeadingWidget(title: 'Non-Veg',vMargin: 1.0, fontSize: 13.0,),
                  ],

                ),
                HeadingWidget(
                  title: name,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  vMargin: 1.0,
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.red, size: 16),
                    SubHeadingWidget(title: '$rating (125)', vMargin: 1.0,),
                  ],
                ),
                HeadingWidget(
                  title: '₹$discountPrice',
                  fontWeight: FontWeight.bold,vMargin: 1.0,
                ),
                Text(
                  '₹$price',
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
                SubHeadingWidget(
                  title: 'Lorem ipsum dolor sit amet',
                  color: AppColors.black,vMargin: 1.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

