import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.isLogin})
      : super(key: key);
  final String text;
  final Function() onPressed;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: primaryColor),
          color: isLogin ? primaryColor : primaryColor.withOpacity(0.1)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.josefinSans(
            color: isLogin ? Colors.white : primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 1),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}
