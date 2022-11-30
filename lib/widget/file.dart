import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/const/sizedbox.dart';

class MyFile extends StatelessWidget {
  const MyFile(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.isVertical})
      : super(key: key);
  final String title;
  final VoidCallback onTap;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
            color: const Color(0xffF1F6FA),
            borderRadius: BorderRadius.circular(10.r)),
        child: isVertical
            ? Row(
                children: [
                  SvgPicture.asset("assets/image/svg/file.svg"),
                  xSize(12),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: black,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  SvgPicture.asset("assets/image/svg/file.svg"),
                  ySize(12),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: black,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
