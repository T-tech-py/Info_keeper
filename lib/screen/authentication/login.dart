// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/widget/button.dart';
import 'package:info_keeper/widget/customTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isNotVisible = true;
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
                'Welcome to Infokeeper.',
                style: GoogleFonts.josefinSans(
                  color: black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                'Fill in your details to continue to access your files.',
                style: GoogleFonts.josefinSans(
                  color: black.withOpacity(0.4),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 48.h),
              CustomTextField(
                label: 'Phone Number',
                hintText: '+234 XXX XXX XXX',
                inputType: TextInputType.number,
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                label: 'Pin',
                hintText: 'XXXX',
                obscure: isNotVisible,
                surfix: IconButton(
                  icon: Icon(
                    isNotVisible ? Icons.visibility : Icons.visibility_off,
                    color: black,
                  ),
                  onPressed: () {
                    if (isNotVisible) {
                      isNotVisible = !isNotVisible;
                    } else {
                      isNotVisible = !isNotVisible;
                    }
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgetPin1');
                    },
                    child: Text(
                      'Forget Password?',
                      style: GoogleFonts.josefinSans(
                          color: primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    )),
              ),
              SizedBox(height: 103.h),
              LoginButton(
                text: "Login",
                onPressed: () {
                  Navigator.pushNamed(context, "/landing");
                },
                isLogin: true,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? ',
                    style: GoogleFonts.josefinSans(
                        color: black.withOpacity(0.4),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'Create Account',
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
