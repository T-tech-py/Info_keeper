// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/widget/button.dart';
import 'package:info_keeper/widget/customTextField.dart';

class ForgetPin1 extends StatelessWidget {
  const ForgetPin1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pin Reset',
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  color: primaryColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 22.h),
              Text(
                'Kindly enter your registered email address to reset your password',
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  color: black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                  label: "Phone Number", hintText: 'Enter Phone Number'),
              SizedBox(height: 40.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LoginButton(
                      text: "Continue",
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgetPin2');
                      },
                      isLogin: true),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
