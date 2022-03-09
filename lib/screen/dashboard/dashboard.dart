// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/mixins/dashboardMixins.dart';
import 'package:info_keeper/widget/customTextField.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          children: [
            SizedBox(height: 90.h),
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
                    onTap: () {},
                    child: SvgPicture.asset("assets/image/svg/arrange.svg"))
              ],
            ),
            SizedBox(height: 24.h),
            CustomTextField(label: '', hintText: 'Search for your Info'),
            SizedBox(height: 32.h),
            Dassboardlogic().fileHandler(context),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
