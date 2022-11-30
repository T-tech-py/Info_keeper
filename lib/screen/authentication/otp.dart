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

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
              'Verify Your Account.',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoginButton(
                    text: 'CONTINUE',
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => Container(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 20.h),
                                    Image.network(
                                      "https://c.tenor.com/_4K_0sndwtEAAAAi/green-white.gif",
                                      height: 200.h,
                                      width: 200.h,
                                      alignment: Alignment.center,
                                    ),
                                    SizedBox(height: 20.h),
                                    Text(
                                      'Your account has been succefullly created',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.josefinSans(
                                        color: black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    LoginButton(
                                      text: "Proceed to dasboard",
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pushNamed(
                                            context, "/landing");
                                      },
                                      isLogin: true,
                                    )
                                  ],
                                ),
                              ));
                    },
                    isLogin: true),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn’t get otp? ',
                  style: GoogleFonts.josefinSans(
                      color: black.withOpacity(0.4),
                      fontSize: 14.sp,
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
                          fontSize: 14.sp,
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
