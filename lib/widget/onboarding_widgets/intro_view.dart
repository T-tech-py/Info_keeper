import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';

class IntroView extends StatelessWidget {
  const IntroView(
      {Key? key,
      required this.imgLink,
      required this.text1,
      required this.text2})
      : super(key: key);
  final String imgLink;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          imgLink,
          height: 280.h,
          width: 310.w,
        ),
        SizedBox(height: 50.h),
        Text(
          text1,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: black.withOpacity(0.7),
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
