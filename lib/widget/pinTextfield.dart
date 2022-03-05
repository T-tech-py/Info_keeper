import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'customTextField.dart';

class PinTextField extends StatelessWidget {
  const PinTextField({
    required this.label,
    required this.onpress,
    required this.controller,
    required this.isPasswordVisible,
    Key? key,
  }) : super(key: key);

  final String label;
  final VoidCallback onpress;
  final TextEditingController controller;
  final bool isPasswordVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
          style: GoogleFonts.josefinSans(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: black,
          ),
        ),
        SizedBox(height: 8.h),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 49.h,
          child: TextField(
            obscureText: isPasswordVisible ? false : true,
            controller: controller,
            decoration: kDecoration.copyWith(
              suffixIcon: IconButton(
                onPressed: onpress,
                icon: Icon(
                  isPasswordVisible == true
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
