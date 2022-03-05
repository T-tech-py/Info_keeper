// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/screen/dashboard/addinfo.dart';
import 'package:info_keeper/screen/dashboard/infoView.dart';
import 'package:info_keeper/widget/customTextField.dart';
import 'package:info_keeper/widget/file.dart';
import 'package:wave_transition/wave_transition.dart';

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
            // Row(
            //   children: [
            //     Column(
            //       children: [
            //         SvgPicture.asset("assets/image/svg/addFile.svg"),
            //         SizedBox(height: 12.h),
            //         Text(
            //           "Add",
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.josefinSans(
            //             fontSize: 14.sp,
            //             fontWeight: FontWeight.w400,
            //             color: black,
            //           ),
            //         ),
            //       ],
            //     ),
            //     SizedBox(width: 10),
            //   ],
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: GridView.builder(
                  itemCount: 50,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              WaveTransition(
                                  child: AddNewFile(),
                                  duration: Duration(seconds: 1),
                                  center: FractionalOffset(0.90, 0.90)));
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/image/svg/newfile.svg"),
                            SizedBox(height: 12.h),
                            Text(
                              "Add File",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.josefinSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: black,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return File(
                      title: "My NIN",
                      onTap: () {
                        Navigator.push(
                            context,
                            WaveTransition(
                                child: InfoView(),
                                duration: Duration(seconds: 2),
                                center: FractionalOffset(0.90, 0.90)));
                      },
                    );
                  }),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
