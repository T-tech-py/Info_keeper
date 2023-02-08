import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/app_bar.dart';
import 'package:info_keeper/const/sizedbox.dart';
import 'package:info_keeper/widget/button.dart';

import '../../const/colors.dart';
import '../../widget/customTextField.dart';

class ChangeCurrentPin extends StatefulWidget {
  const ChangeCurrentPin({Key? key}) : super(key: key);

  @override
  State<ChangeCurrentPin> createState() => _ChangeCurrentPinState();
}

class _ChangeCurrentPinState extends State<ChangeCurrentPin> {
  bool showCurrentPin = false;
  bool showNewPin = false;
  bool showConfirmPin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Change Current Pin"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: ListView(children: [
          ySize(40),
          Text(
            'Infokeeper',
            style: GoogleFonts.josefinSans(
              color: primaryColor,
              fontSize: 40.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          ySize(32),
          Text(
            'Change Your Pin.',
            textAlign: TextAlign.start,
            style: GoogleFonts.josefinSans(
              color: black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          ySize(24),
          CustomTextField(
            label: "Current Pin",
            hintText: "XXXX",
            obscure: showCurrentPin,
            surfix: IconButton(
              icon: Icon(
                showCurrentPin ? Icons.visibility : Icons.visibility_off,
                color: black,
              ),
              onPressed: () {
                if (showCurrentPin) {
                  showCurrentPin = !showCurrentPin;
                } else {
                  showCurrentPin = !showCurrentPin;
                }
                setState(() {});
              },
            ),
          ),
          ySize(20),
          CustomTextField(
            label: "New Pin",
            hintText: "XXXX",
            obscure: showNewPin,
            surfix: IconButton(
              icon: Icon(
                showNewPin ? Icons.visibility : Icons.visibility_off,
                color: black,
              ),
              onPressed: () {
                if (showNewPin) {
                  showNewPin = !showNewPin;
                } else {
                  showNewPin = !showNewPin;
                }
                setState(() {});
              },
            ),
          ),
          ySize(20),
          CustomTextField(
            label: "Confirm New Pin",
            hintText: "XXXX",
            obscure: showConfirmPin,
            surfix: IconButton(
              icon: Icon(
                showConfirmPin ? Icons.visibility : Icons.visibility_off,
                color: black,
              ),
              onPressed: () {
                if (showConfirmPin) {
                  showConfirmPin = !showConfirmPin;
                } else {
                  showConfirmPin = !showConfirmPin;
                }
                setState(() {});
              },
            ),
          ),
          ySize(40),
          LoginButton(text: "SUBMIT", onPressed: () {}, isLogin: true),
          ySize(50),
        ]),
      ),
    );
  }
}
