// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/router/navigators.dart';
import 'package:info_keeper/widget/button.dart';
import 'package:info_keeper/widget/customTextField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ListView(
            children: [
              SizedBox(height: 84.h),
              Text(
                'Infokeeper',
                style: GoogleFonts.josefinSans(
                  color: primaryColor,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                'Create your infokeeper  account.',
                style: GoogleFonts.josefinSans(
                  color: black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 48.h),
              CustomTextField(
                label: 'Surname',
                hintText: '',
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                label: 'FirstName',
                hintText: '',
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                label: 'Phone Number',
                hintText: '',
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                label: 'Create Pin',
                hintText: '',
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                label: 'Confirm Pin',
                hintText: '',
              ),
              SizedBox(height: 62.h),
              LoginButton(
                text: "Create account",
                onPressed: () {
                  Navigator.pushNamed(context, "/otpScreen");
                },
                isLogin: true,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: GoogleFonts.josefinSans(
                        color: black.withOpacity(0.4),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.josefinSans(
                            color: primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      )),
                ],
              ),
              SizedBox(height: 140.h),
            ],
          ),
        ),
      ),
    );
  }
}
