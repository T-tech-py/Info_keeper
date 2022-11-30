import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';

AppBar appBar(BuildContext context, String text) => AppBar(
      backgroundColor: white,
      primary: true,
      elevation: 0.5,
      titleSpacing: 7,
      centerTitle: true,
      automaticallyImplyLeading: true,
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: SvgPicture.asset("assets/image/svg/back.svg",
                width: 30.w, height: 30.w),
          )),
      title: Text(
        text,
        style: GoogleFonts.josefinSans(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: black,
        ),
      ),
    );
