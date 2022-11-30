import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.label,
    required this.hintText,
    Key? key,
    this.inputType,
    this.obscure,
    this.prefix,
    this.surfix,
  }) : super(key: key);

  final String label;
  final String hintText;
  final TextInputType? inputType;
  final bool? obscure;
  final Widget? prefix;
  final Widget? surfix;
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
          height: 49.h,
          child: TextField(
            obscureText: obscure ?? false,
            keyboardType: inputType ?? TextInputType.text,
            decoration: kDecoration.copyWith(
                suffixIcon: surfix ?? const SizedBox(),
                hintText: hintText,
                hintStyle: GoogleFonts.josefinSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38)),
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
    borderSide: BorderSide(color: primaryColor),
  ),
  // border: OutlineInputBorder(borderRadius:  BorderRadius.circular(10),

  // ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: primaryColor,
      ),
      borderRadius: BorderRadius.circular(10)),
);
