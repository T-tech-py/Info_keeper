import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/const/sizedbox.dart';

class ViewPicture extends StatelessWidget {
  const ViewPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ySize(46),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset("assets/image/svg/back.svg")),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.share,
                      color: primaryColor,
                    ))
              ],
            ),
          ),
          ySize(59),
        ],
      ),
    );
  }
}
