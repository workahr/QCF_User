import 'package:flutter/material.dart';
import 'package:namfood/constants/constants.dart';
import 'package:namfood/pages/profile/edit_profilepage.dart';
import 'package:namfood/widgets/button_widget.dart';

import '../../address/edit_addresspage.dart';
import '../../constants/app_assets.dart';
import '../../widgets/heading_widget.dart';
import '../../widgets/sub_heading_widget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: AppBar(
            title: Text(
              'My Profile',
              style: TextStyle(color: AppColors.white),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.red,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage(AppAssets.profileavathar),
                            radius: 30.0,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingWidget(
                                title: "Johan Singh",
                                color: AppColors.white,
                              ),
                              HeadingWidget(
                                title: "999548547",
                                color: AppColors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfilepage()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.white,
                        ),
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 18,
                          color: AppColors.red,
                        ),
                        label: Text(
                          'Edit',
                          style: TextStyle(
                            color: AppColors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.address,
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  HeadingWidget(
                    title: "Address",
                    color: AppColors.red,
                  ),
                ],
              ),
              GestureDetector(
                child: Icon(
                  Icons.add,
                  color: AppColors.red,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditAddresspage()));
                },
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    // padding: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppAssets.home_black,
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              HeadingWidget(
                                title: "Home",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Wrap(
                            children: [
                              HeadingWidget(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  title:
                                      'No 37 Paranjothi Nagar Thalakoidi, velour Nagar Trichy-620005, Landmark-Andavan collage')
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          HeadingWidget(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            title: "Contact : 1234567890",
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 35,
                                width: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.red, width: 1.5),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.red,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 35,
                                width: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.red, width: 1.5),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.red,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors.grey1,
                  ),
                ],
              );
            },
          ),
        ),
        Positioned(
            child: Column(
          children: [
            Container(
              height: 50,
              child: ListTile(
                leading: Icon(
                  Icons.feedback_outlined,
                  color: AppColors.red,
                ),
                title: HeadingWidget(
                  title: "Feedback & Complaints",
                  color: AppColors.red,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.red,
                ),
              ),
            ),
            Divider(color: AppColors.grey1),
            Container(
              height: 50,
              child: ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: AppColors.red,
                ),
                title: HeadingWidget(
                  title: "Log out",
                  color: AppColors.red,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.red,
                ),
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
