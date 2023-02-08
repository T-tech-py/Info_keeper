import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/app_bar.dart';

import '../../const/colors.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Notifications"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "No Notifications",
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: black3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
