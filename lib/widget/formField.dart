import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    required this.label,
    required this.hintText,
    Key? key,
    required this.controller,
    this.enable,
  }) : super(key: key);

  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool? enable;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
          style: GoogleFonts.lato(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xff575757),
          ),
        ),
        SizedBox(height: 8.h),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 147.h,
          child: TextField(
            enabled: enable ?? true,
            controller: controller,
            readOnly: true,
            maxLines: 147,
            decoration: kDecoration.copyWith(
                suffixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.copy)),
                hintText: hintText,
                hintStyle: GoogleFonts.josefinSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff05182A))),
          ),
        ),
      ],
    );
  }
}

var kDecoration = InputDecoration(
  // focusColor: primaryColor.withOpacity(0.1),
  fillColor: Color(0xffF1F5F8),

  filled: true,
  contentPadding:
      EdgeInsets.only(left: 10.w, bottom: 10.h, top: 10.h, right: 10.w),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Color(0xffF1F5F8)),
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: primaryColor,
      ),
      borderRadius: BorderRadius.circular(10)),
);
