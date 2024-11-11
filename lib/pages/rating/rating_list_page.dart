import 'package:flutter/material.dart';
import 'package:namfood/widgets/heading_widget.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';

class RatingListPage extends StatefulWidget {
  @override
  _RatingListPageState createState() => _RatingListPageState();
}

class _RatingListPageState extends State<RatingListPage> {
  // Dummy data for reviews
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'Tony Reginal',
      'profilePic': AppAssets.profileimg,
      'rating': 4.5,
      'review': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'dishes': {'Chicken Biryani': 4, 'Chicken Kebab': 4},
       'color': AppColors.darkGreen
    },
    {
      'name': 'Tony Reginal',
      'profilePic': AppAssets.profileimg,
      'rating': 3.5,
      'review': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'dishes': {'Chicken Biryani': 3, 'Chicken Kebab': 4},
       'color': AppColors.secondary
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: HeadingWidget(title: 'Review & Rating', color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant Info Section
            Text(
              'Grill Chicken Arabian Restaurant',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              
               // SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(
                  '4.0',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
                ),
                    buildStarRow(4),
                    SizedBox(height: 5),
                    Text('2,364 Reviews', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Rating Distribution Bar
            buildRatingDistribution(),
             Divider(color: Colors.grey[300]),
            SizedBox(height: 20),
            // Detailed Reviews Section
            Text(
              'Detailed Reviews',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...reviews.map((review) => buildReviewCard(review)).toList(),
          ],
        ),
      ),
    );
  }

  // Method to build star rating row
  Widget buildStarRow(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: index < rating ? Colors.amber : Colors.grey[300],
        );
      }),
    );
  }

  // Method to build rating distribution bars
  Widget buildRatingDistribution() {
    return Column(
      children: [
        buildRatingBar(5, 0.7),
        buildRatingBar(4, 0.6),
        buildRatingBar(3, 0.5),
        buildRatingBar(2, 0.4),
        buildRatingBar(1, 0.2),
      ],
    );
  }

  // Method to build individual rating bar
  Widget buildRatingBar(int star, double fillPercentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text('$star'),
          SizedBox(width: 10),
          Expanded(
            child: LinearProgressIndicator(
              value: fillPercentage,
              color: Colors.red,
              backgroundColor: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build individual review card
 Widget buildReviewCard(Map<String, dynamic> review) {
  return Padding(
    padding: EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            CircleAvatar(
              backgroundImage: NetworkImage(review['profilePic']),
              radius: 25,
            ),
            SizedBox(width: 16),
            // Review Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Reviewer Name and Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(review['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                       Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: review['color'],
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
                    ],
                  ),
                  SizedBox(height: 10),
                  // Dishes Rating
                  ...review['dishes'].entries.map((dish) => Row(
                        children: [
                          Text(dish.key),
                          SizedBox(width: 10),
                          buildStarRow(dish.value),
                        ],
                      )),
                  SizedBox(height: 10),
                  // Review Text
                  Text(
                    review['review'],
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(color: Colors.grey[300]),  // Add a divider after each review card
      ],
    ),
  );
}
}

