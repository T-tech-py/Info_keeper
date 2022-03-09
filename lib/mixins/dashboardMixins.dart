import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/screen/dashboard/addinfo.dart';
import 'package:info_keeper/screen/dashboard/infoView.dart';
import 'package:info_keeper/widget/file.dart';
import 'package:wave_transition/wave_transition.dart';

List numbersOfAddedFiles = [];

class Dassboardlogic {
  Widget fileHandler(BuildContext context) {
    if (numbersOfAddedFiles.length < 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  WaveTransition(
                      child: AddNewFile(),
                      duration: const Duration(seconds: 1),
                      center: const FractionalOffset(0.90, 0.90)));
            },
            child: Column(
              children: [
                SvgPicture.asset("assets/image/svg/newfile.svg"),
                SizedBox(height: 12.h),
                Text(
                  "Add File",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 200.h),
          Center(
            child: Text(
              "No Documenent added!",
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                fontSize: 18.sp,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Center(
            child: Text(
              "Tap on the + button to add a new document",
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                fontSize: 17.sp,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      );
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      child: GridView.builder(
          itemCount: 50,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return MyFile(
              title: "My NIN",
              onTap: () {
                Navigator.push(
                    context,
                    WaveTransition(
                        child: InfoView(),
                        duration: Duration(seconds: 2),
                        center: FractionalOffset(0.90, 0.90)));
              },
            );
          }),
    );
  }
}
