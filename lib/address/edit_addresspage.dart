import 'package:flutter/material.dart';
import 'package:namfood/constants/app_colors.dart';
import 'package:namfood/constants/constants.dart';
import 'package:namfood/widgets/custom_text_field.dart';

import '../widgets/button_widget.dart';

class EditAddresspage extends StatefulWidget {
  const EditAddresspage({super.key});

  @override
  State<EditAddresspage> createState() => _EditAddresspageState();
}

class _EditAddresspageState extends State<EditAddresspage> {
  int _selectedIndex = 0; // Track the selected tab

  // Method to change the tab
  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20.0),
        child: Column(
          children: [
            // Custom Tab Bar with ElevatedButtons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Home Tab
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () => _onTabSelected(0),
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          _selectedIndex == 0 ? Colors.white : AppColors.red,
                      backgroundColor:
                          _selectedIndex == 0 ? AppColors.red : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColors.red),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _selectedIndex == 0
                              ? AppAssets.home_white
                              : AppAssets.home_red,
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(width: 12),
                        Text('Home'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),

                // Work Tab
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () => _onTabSelected(1),
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          _selectedIndex == 1 ? Colors.white : AppColors.red,
                      backgroundColor:
                          _selectedIndex == 1 ? AppColors.red : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColors.red),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _selectedIndex == 1
                              ? AppAssets.work_white
                              : AppAssets.work_red,
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(width: 8),
                        Text('Work'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),

                // Others Tab
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () => _onTabSelected(2),
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          _selectedIndex == 2 ? Colors.white : AppColors.red,
                      backgroundColor:
                          _selectedIndex == 2 ? AppColors.red : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColors.red),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: _selectedIndex == 2
                              ? Colors.white
                              : AppColors.red,
                        ),
                        SizedBox(width: 8),
                        Text('Others'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Content for each tab
            Expanded(
              child: IndexedStack(
                index: _selectedIndex, // Display the selected tab's content
                children: [
                  Column(
                    children: [
                      CustomeTextField(
                        borderColor: AppColors.grey,
                        labelText: 'Contact Number',
                        width: screenWidth,
                      ),
                      CustomeTextField(
                        borderColor: AppColors.grey,
                        labelText: 'Land Mark',
                        width: screenWidth,
                      ),
                      CustomeTextField(
                        borderColor: AppColors.grey,
                        labelText: 'Address',
                        lines: 3,
                        width: screenWidth,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomeTextField(
                        borderColor: AppColors.grey,
                        labelText: 'Save As',
                        width: screenWidth,
                      ),
                      CustomeTextField(
                        borderColor: AppColors.grey,
                        labelText: 'Contact Number',
                        width: screenWidth,
                      ),
                      CustomeTextField(
                        borderColor: AppColors.grey,
                        labelText: 'Land Mark',
                        width: screenWidth,
                      ),
                      CustomeTextField(
                        borderColor: AppColors.grey,
                        labelText: 'Address',
                        lines: 3,
                        width: screenWidth,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomeTextField(
                        borderColor: AppColors.grey,
                        labelText: 'Contact Number',
                        width: screenWidth,
                      ),
                      CustomeTextField(
                        borderColor: AppColors.grey,
                        labelText: 'Land Mark',
                        width: screenWidth,
                      ),
                      CustomeTextField(
                        borderColor: AppColors.grey,
                        labelText: 'Address',
                        lines: 3,
                        width: screenWidth,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.04, horizontal: screenWidth * 0.04),
        child: ButtonWidget(
          borderRadius: 10,
          title: "Submit",
          width: screenWidth,
          color: AppColors.red,
          onTap: () {},
        ),
      ),
    );
  }
}
