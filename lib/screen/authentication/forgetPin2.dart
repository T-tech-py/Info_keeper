// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/app_bar.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/const/sizedbox.dart';
import 'package:info_keeper/widget/button.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flutter/services.dart';

class ForgetPin2 extends StatefulWidget {
  const ForgetPin2({Key? key}) : super(key: key);

  @override
  _ForgetPin2State createState() => _ForgetPin2State();
}

class _ForgetPin2State extends State<ForgetPin2> {
  TextEditingController otp = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: bodyColor,
      border: Border.all(color: primaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 80.0.sp,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.blue,
    );
    // Scaffold.of(context)
    //   ..hideCurrentSnackBar()
    //   ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ""),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          children: [
            ySize(40),
            Text(
              'Infokeeper',
              style: GoogleFonts.josefinSans(
                color: primaryColor,
                fontSize: 40.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            ySize(40),
            Text(
              'Enter OTP',
              textAlign: TextAlign.start,
              style: GoogleFonts.josefinSans(
                color: black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            ySize(8),
            Text(
              'Enter the 4 digits OTP code received on your phone 0703****311',
              textAlign: TextAlign.start,
              style: GoogleFonts.josefinSans(
                color: black2,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            ySize(36),
            SizedBox(
              height: 62.h,
              child: PinPut(
                eachFieldWidth: 62,
                fieldsCount: 4,
                onSubmit: (String pin) => _showSnackBar(pin, context),
                focusNode: _pinPutFocusNode,
                controller: otp,
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                selectedFieldDecoration: _pinPutDecoration,
                followingFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: primaryColor.withOpacity(0.65),
                  ),
                ),
              ),
            ),
            ySize(40),
            LoginButton(
                text: 'Submit',
                onPressed: () {
                  Navigator.pushNamed(context, '/newPin');
                },
                isLogin: true),
            ySize(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn’t get otp? ',
                  style: GoogleFonts.josefinSans(
                      color: black2,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Center(
                                child: SizedBox(
                                    height: 60.h,
                                    width: 60.h,
                                    child: CircularProgressIndicator()),
                              ));
                    },
                    child: Text(
                      'Resend',
                      style: GoogleFonts.josefinSans(
                          color: primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    )),
              ],
            ),
            SizedBox(height: 140.h),
          ],
        ),
      ),
    );
  }
}
