// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
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
      color: primaryColor.withOpacity(0.3),
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
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: ListView(
            children: [
              SizedBox(height: 20.h),
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
                'An OTP has been sent to your email address. Kindly enter it to reset your password',
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  color: black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 32.h),
              SizedBox(
                height: 70.h,
                child: PinPut(
                  fieldsCount: 5,
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
                      color: black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LoginButton(
                      text: 'Submit',
                      onPressed: () {
                        Navigator.pushNamed(context, '/newPin');
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
      ),
    );
  }
}
