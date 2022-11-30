// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/const/sizedbox.dart';
import 'package:info_keeper/mixins/dashboardMixins.dart';
import 'package:info_keeper/widget/customTextField.dart';

enum View { vertical, horizontal }

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var appView = View.horizontal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          children: [
            ySize(46),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi, Lanre",
                  style: GoogleFonts.josefinSans(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: black,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      if (appView == View.horizontal) {
                        appView = View.vertical;
                      } else if (appView == View.vertical) {
                        appView = View.horizontal;
                      }
                      setState(() {});
                    },
                    child: SvgPicture.asset(
                      appView == View.horizontal
                          ? "assets/image/svg/vertical.svg"
                          : "assets/image/svg/arrange.svg",
                      color: primaryColor,
                    ))
              ],
            ),
            ySize(20),
            CustomTextField(label: '', hintText: 'Search for your Info'),
            ySize(24),
            Dassboardlogic().fileHandler(context, appView),
            ySize(100),
          ],
        ),
      ),
    );
  }
}
