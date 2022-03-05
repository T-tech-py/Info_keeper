import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/widget/button.dart';

class FileDeleted extends StatelessWidget {
  const FileDeleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset('assets/image/svg/bins.svg')),
            Text(
              "File successfully Deleted.",
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                color: black,
              ),
            ),
            SizedBox(height: 186.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LoginButton(
                  text: "BACK TO HOME",
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/landing', (route) => false);
                  },
                  isLogin: true,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
