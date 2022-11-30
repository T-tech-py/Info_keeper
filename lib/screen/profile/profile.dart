import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/colors.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(children: [
          Container(
            height: 100.h,
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 4.5.h)
            ]),
            padding: EdgeInsets.only(top: 60.h),
            alignment: Alignment.center,
            child: Text(
              "Profile",
              style: GoogleFonts.josefinSans(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: black,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
