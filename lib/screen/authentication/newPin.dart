// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/widget/button.dart';
import 'package:info_keeper/widget/pinTextfield.dart';

class PinReset extends StatefulWidget {
  PinReset({Key? key}) : super(key: key);

  @override
  State<PinReset> createState() => _PinResetState();
}

class _PinResetState extends State<PinReset> {
  TextEditingController newPin = TextEditingController();

  TextEditingController confirmNewPin = TextEditingController();

  bool showPin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Change Pin',
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                color: primaryColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 22.h),
            PinTextField(
                label: "New Pin",
                onpress: () {
                  if (showPin = false) {
                    setState(() {
                      showPin = true;
                    });
                  } else if (showPin = true) {
                    setState(() {
                      showPin = false;
                    });
                  }
                },
                controller: newPin,
                isPasswordVisible: showPin),
            SizedBox(height: 30.h),
            PinTextField(
                label: "New Pin",
                onpress: () {
                  if (showPin = false) {
                    setState(() {
                      showPin = true;
                    });
                  } else if (showPin = true) {
                    setState(() {
                      showPin = false;
                    });
                  }
                },
                controller: newPin,
                isPasswordVisible: showPin),
            SizedBox(height: 40.h),
            LoginButton(text: "Change Pin", onPressed: () {}, isLogin: true)
          ],
        ),
      ),
    );
  }
}
