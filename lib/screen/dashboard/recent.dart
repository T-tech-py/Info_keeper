// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/widget/file.dart';

class Recent extends StatelessWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset("assets/image/svg/back.svg",
                    width: 30.w, height: 30.w),
              )),
          title: Text(
            "Recently Viewed",
            style: GoogleFonts.josefinSans(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: black,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 42.h),
          child: GridView.builder(
              itemCount: 5,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return File(
                  title: "My NIN",
                  onTap: () {
                    Navigator.pushNamed(context, '/infoView');
                  },
                );
              }),
        ),
      ),
    );
  }
}
