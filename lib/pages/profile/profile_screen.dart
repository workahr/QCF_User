import 'package:flutter/material.dart';
import 'package:namfood/constants/constants.dart';
import 'package:namfood/pages/models/myprofile_title_model.dart';
import 'package:namfood/pages/profile/edit_profilepage.dart';
import 'package:namfood/pages/profile/feedback_page.dart';
import 'package:namfood/widgets/button_widget.dart';
import 'package:namfood/widgets/outline_btn_widget.dart';

import '../../address/edit_addresspage.dart';
import '../../constants/app_assets.dart';
import '../../services/comFuncService.dart';
import '../../services/nam_food_api_service.dart';
import '../../widgets/heading_widget.dart';
import '../../widgets/sub_heading_widget.dart';
import '../models/myprofile_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _expandedIndex = -1;
  int all_expandedIndex = -1;
  final NamFoodApiService apiService = NamFoodApiService();

  @override
  void initState() {
    super.initState();

    getmyprofile();
    getmyprofiletitle();
  }

  //myprofile
  List<myprofilelist> myprofilepage = [];
  List<myprofilelist> myprofilepageAll = [];
  bool isLoading = false;

  Future getmyprofile() async {
    setState(() {
      isLoading = true;
    });

    try {
      var result = await apiService.getmyprofile();
      var response = myprofilemodelFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          myprofilepage = response.list;
          myprofilepageAll = myprofilepage;
          isLoading = false;
        });
      } else {
        setState(() {
          myprofilepage = [];
          myprofilepageAll = [];
          isLoading = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        myprofilepage = [];
        myprofilepageAll = [];
        isLoading = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

  //myprofiletitle
  List<myprofiletitles> myprofiletitlepage = [];
  List<myprofiletitles> myprofiletitlepageAll = [];
  bool isLoading1 = false;

  Future getmyprofiletitle() async {
    setState(() {
      isLoading1 = true;
    });

    try {
      var result = await apiService.getmyprofiletitle();
      var response = myprofiletitlemodelFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          myprofiletitlepage = response.list;
          myprofiletitlepageAll = myprofiletitlepage;
          isLoading1 = false;
        });
      } else {
        setState(() {
          myprofiletitlepage = [];
          myprofiletitlepageAll = [];
          isLoading1 = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        myprofiletitlepage = [];
        myprofiletitlepageAll = [];
        isLoading1 = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

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
                      height: 60,
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount:
                      myprofiletitlepage.length, // Set the number of items
                  itemBuilder: (context, index) {
                    final e = myprofiletitlepage[index];
                    final status = e.title.toString();
                    if (status == 'Address')
                      return Container(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.asset(
                                e.icon.toString(),
                                height: 24,
                                width: 24,
                              ),
                              title: HeadingWidget(
                                title: e.title.toString(),
                                color: AppColors.black,
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
                              onTap: () {
                                setState(() {
                                  all_expandedIndex =
                                      all_expandedIndex == index ? -1 : index;
                                });
                              },
                            ),
                            if (all_expandedIndex == index)
                              Column(
                                children: [
                                  SizedBox(
                                    height: 400,
                                    child: ListView.builder(
                                      itemCount: myprofilepage.length,
                                      itemBuilder: (context, index) {
                                        final e = myprofilepage[index];
                                        return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0),
                                            child: Column(children: [
                                              Container(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            e.icon.toString(),
                                                            height: 24,
                                                            width: 24,
                                                          ),
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          HeadingWidget(
                                                            title: e.type
                                                                .toString(),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 6,
                                                      ),
                                                      Wrap(
                                                        children: [
                                                          HeadingWidget(
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              title: e.address
                                                                  .toString()),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 6,
                                                      ),
                                                      HeadingWidget(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        title: e.contact
                                                            .toString(),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              EditAddresspage()));
                                                            },
                                                            child: Container(
                                                              height: 35,
                                                              width: 80,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: AppColors
                                                                          .red,
                                                                      width:
                                                                          1.5),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: Center(
                                                                  child: Text(
                                                                'Edit',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color:
                                                                        AppColors
                                                                            .red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          Container(
                                                            height: 35,
                                                            width: 80,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        AppColors
                                                                            .red,
                                                                    width: 1.5),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Center(
                                                                child: Text(
                                                              'Delete',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color:
                                                                      AppColors
                                                                          .red,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Divider(
                                                        color: AppColors.grey,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]));
                                      },
                                    ),
                                  ),

                                  //outlineButton
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 20.0),
                                    child: OutlineBtnWidget(
                                      borderColor: AppColors.red,
                                      height: 50,
                                      title: 'Add new address',
                                      titleColor: AppColors.red,
                                      icon: Icons.add,
                                      iconColor: AppColors.red,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      );
                    else if (status == 'Feedback & Complaints')
                      return Container(
                        height: 50,
                        child: ListTile(
                          leading: Image.asset(
                            e.icon.toString(),
                            height: 24,
                            width: 24,
                          ),
                          title: HeadingWidget(
                            title: e.title.toString(),
                            color: AppColors.black,
                          ),
                          trailing: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                              onPressed: () {
                                setState(() {});
                              }),
                          onTap: () {
                            setState(() {});
                          },
                        ),
                      );
                    else if (status == 'Log out')
                      return Container(
                        height: 50,
                        child: ListTile(
                          leading: Image.asset(
                            e.icon.toString(),
                            height: 24,
                            width: 24,
                          ),
                          title: HeadingWidget(
                            title: e.title.toString(),
                            color: AppColors.black,
                          ),
                          trailing: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                              onPressed: () {
                                setState(() {});
                              }),
                          onTap: () {
                            setState(() {});
                          },
                        ),
                      );
                    Divider(
                      color: AppColors.black,
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
