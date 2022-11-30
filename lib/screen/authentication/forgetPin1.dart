// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/app_bar.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/const/sizedbox.dart';
import 'package:info_keeper/widget/button.dart';
import 'package:info_keeper/widget/customTextField.dart';

class ForgetPin1 extends StatelessWidget {
  const ForgetPin1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, ""),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ySize(40),
              Text(
                'Infokeeper',
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  color: primaryColor,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ySize(40),
              Text(
                'Reset Your Pin',
                textAlign: TextAlign.start,
                style: GoogleFonts.josefinSans(
                  color: black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ySize(8),
              Text(
                'Enter the phone number associated with your account and we '
                ' will send an OTP to reset your pin.',
                textAlign: TextAlign.start,
                style: GoogleFonts.josefinSans(
                  color: black2,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ySize(54),
              CustomTextField(
                  label: "Phone Number", hintText: 'Enter Phone Number'),
              ySize(32),
              LoginButton(
                  text: "Continue",
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgetPin2');
                  },
                  isLogin: true)
            ],
          ),
        ),
      ),
    );
  }
}
