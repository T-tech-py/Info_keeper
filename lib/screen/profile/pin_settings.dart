import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/app_bar.dart';
import 'package:info_keeper/const/sizedbox.dart';
import 'package:info_keeper/router/navigators.dart';
import 'package:info_keeper/screen/profile/change_pin.dart';

import '../../const/colors.dart';

class PinSettings extends StatelessWidget {
  const PinSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Pin Settings"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ySize(10),
          ListTile(
            tileColor: white,
            title: Text(
              "Change Pin",
              style: GoogleFonts.josefinSans(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: black3,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => navigate(context, const ChangeCurrentPin()),
          ),
          ySize(10),
        ],
      ),
    );
  }
}
