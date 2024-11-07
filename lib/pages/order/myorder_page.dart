import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dotted_line/dotted_line.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/heading_widget.dart';
import '../../widgets/sub_heading_widget.dart';

class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _expandedIndex = -1;
  int all_expandedIndex = -1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> orders = [
    {'id': '0012345', 'items': 12, 'status': 'On Delivery'},
    {'id': '0012345', 'items': 12, 'status': 'Completed'},
    {'id': '0012345', 'items': 12, 'status': 'Cancelled'},
    {'id': '0012345', 'items': 12, 'status': 'on'},
  ];

  Widget getStatusIcon(String status) {
    switch (status) {
      case 'On Delivery':
        return Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.lightred,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 32,
              color: AppColors.red,
            ));

      case 'Completed':
        return Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.lightred,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 32,
              color: AppColors.red,
            ));
      case 'Cancelled':
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.lightred,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.shopping_bag_outlined,
            size: 32,
            color: AppColors.red,
          ),
        );
      default:
        return Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.lightred,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 32,
              color: AppColors.red,
            ));
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'On Delivery':
        return Colors.yellow.shade900;
      case 'Completed':
        return Colors.white;
      case 'Cancelled':
        return Colors.white;
      default:
        return Colors.white;
    }
  }

  Color circleColor(String status) {
    switch (status) {
      case 'On Delivery':
        return Colors.red;
      case 'Completed':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          'My Order',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
            child: CustomeTextField(
                width: screenWidth,
                hint: 'Search Beverage or Foods',
                hintColor: AppColors.grey1,
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: AppColors.grey1,
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                final status = order['status'] as String;
                final color = getStatusColor(status);
                final icon = getStatusIcon(status);
                final circlecolor = circleColor(status);

                return Card(
                    margin: EdgeInsets.all(8.0),
                    child: Column(children: [
                      ListTile(
                        leading: getStatusIcon(status),
                        title: HeadingWidget(title: 'Order ID#${order['id']}'),
                        subtitle: Row(
                          children: [
                            SubHeadingWidget(title: '${order['items']} Items'),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.circle,
                              size: 11,
                              color: circlecolor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SubHeadingWidget(
                              title: status,
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            all_expandedIndex == index
                                ? Icons.expand_less
                                : Icons.expand_more,
                          ),
                          onPressed: () {
                            setState(() {
                              all_expandedIndex =
                                  all_expandedIndex == index ? -1 : index;
                            });
                          },
                        ),
                        onTap: () {},
                      ),
                      if (all_expandedIndex == index)
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.blue,
                                            width: 3,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.circle,
                                            color: AppColors.blue,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                      const DottedLine(
                                        direction: Axis.vertical,
                                        dashColor: AppColors.blue,
                                        lineLength: 50,
                                        dashLength: 2,
                                        dashGapLength: 2,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 8),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order Placed',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'January 19th 12:02 AM',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.blue,
                                            width: 3,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.circle,
                                            color: AppColors.blue,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                      const DottedLine(
                                        direction: Axis.vertical,
                                        dashColor: AppColors.blue,
                                        lineLength: 50,
                                        dashLength: 2,
                                        dashGapLength: 2,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 8),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order Confirmed',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'January 19th 12:02 AM',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: AppColors.bluetone,
                                    size: 18,
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your Order On Delivery by Courier',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'January 19th 12:02 AM',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              //  SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Order Cancel',
                                  style: TextStyle(
                                      color: AppColors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: AppColors.red),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
