import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/app_bar.dart';
import 'package:info_keeper/const/sizedbox.dart';

import '../../const/colors.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Account Settings"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            ySize(10),
            ListTile(
              tileColor: white,
              title: Text(
                "Clear Recents",
                style: GoogleFonts.josefinSans(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: black3,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ySize(10),
            ListTile(
              tileColor: white,
              title: Text(
                "Delete all files",
                style: GoogleFonts.josefinSans(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: black3,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
