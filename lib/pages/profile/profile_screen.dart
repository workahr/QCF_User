import 'package:flutter/material.dart';
import 'package:namfood/constants/constants.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: HeadingWidget(
            title: 'My Profile',
            fontSize: 24,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppAssets.profileimg,
                      height: 72,
                      width: 72,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: Container(
                            // height: 70,
                            // width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                color: AppColors.lightred,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  HeadingWidget(
                                    title: 'Tony Thomas',
                                    color: AppColors.red,
                                  ),
                                  // SizedBox(width: 30),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      // Add your edit profile functionality here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      color: AppColors.red,
                                    ),
                                    label: Text(
                                      'Edit',
                                      style: TextStyle(
                                        color: AppColors.red,
                                      ),
                                    ),
                                  )
                                ]))),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Image.asset(
                          AppAssets.genderal,
                          height: 50,
                          width: 50,
                        ),
                        SubHeadingWidget(
                          title: 'General',
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ]),
                      Icon(
                        Icons.expand_more,
                        color: AppColors.darkGreen,
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [
                      Image.asset(
                        AppAssets.profileorderhistroy,
                        height: 72,
                        width: 72,
                      ),
                      SubHeadingWidget(
                        title: 'Order history',
                        color: Colors.black,
                      )
                    ]),
                    Column(children: [
                      Image.asset(
                        AppAssets.profileaddress,
                        height: 72,
                        width: 72,
                      ),
                      SubHeadingWidget(
                        title: 'Address',
                        color: Colors.black,
                      ),
                    ]),
                    Column(children: [
                      Image.asset(
                        AppAssets.profilepayment,
                        height: 72,
                        width: 72,
                      ),
                      SubHeadingWidget(
                        title: 'Payment',
                        color: Colors.black,
                      ),
                    ]),
                    Column(children: [
                      Image.asset(
                        AppAssets.profilesettings,
                        height: 72,
                        width: 72,
                      ),
                      SubHeadingWidget(
                        title: 'Settings',
                        color: Colors.black,
                      ),
                    ]),
                  ],
                ),
                SizedBox(height: 20),
                _buildListTile(Icons.favorite_border, 'Favorite', () {}),
                SizedBox(height: 20),
                _buildListTile(
                    Icons.receipt_long, 'Transaction History', () {}),
                SizedBox(height: 20),
                _buildListTile(Icons.lock_outline, 'Password Manager', () {}),
                SizedBox(height: 20),
                _buildListTile(Icons.logout, 'Log out', () {}),
              ],
            ),
          ),
        ));
  }

  Widget _buildListTile(IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.red),
      title: SubHeadingWidget(
        title: text,
        color: Colors.black,
        fontSize: 20,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.red,
      ),
      onTap: onTap,
    );
  }
}
