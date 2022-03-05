import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';

class File extends StatelessWidget {
  const File({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset("assets/image/svg/file.svg"),
          SizedBox(height: 12.h),
          Text(
            "NIN",
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
}
