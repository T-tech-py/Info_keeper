// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/app_bar.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/const/sizedbox.dart';
import 'package:info_keeper/widget/button.dart';
import 'package:info_keeper/widget/customTextField.dart';
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
  bool showPin2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ""),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
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
              'Create New Pin.',
              textAlign: TextAlign.start,
              style: GoogleFonts.josefinSans(
                color: black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            ySize(8),
            Text(
              'Set a new pin for your account so you can login and access'
              ' your documents.',
              textAlign: TextAlign.start,
              style: GoogleFonts.josefinSans(
                color: black2,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            ySize(72),
            CustomTextField(
              label: "New Pin",
              hintText: "XXXX",
              obscure: showPin,
              surfix: IconButton(
                icon: Icon(
                  showPin ? Icons.visibility : Icons.visibility_off,
                  color: black,
                ),
                onPressed: () {
                  if (showPin) {
                    showPin = !showPin;
                  } else {
                    showPin = !showPin;
                  }
                  setState(() {});
                },
              ),
            ),
            ySize(16),
            CustomTextField(
              label: "Confirm New Pin",
              hintText: "XXXX",
              obscure: showPin2,
              surfix: IconButton(
                icon: Icon(
                  showPin2 ? Icons.visibility : Icons.visibility_off,
                  color: black,
                ),
                onPressed: () {
                  if (showPin) {
                    showPin2 = !showPin2;
                  } else {
                    showPin2 = !showPin2;
                  }
                  setState(() {});
                },
              ),
            ),
            ySize(40),
            LoginButton(text: "Change Pin", onPressed: () {}, isLogin: true)
          ],
        ),
      ),
    );
  }
}
