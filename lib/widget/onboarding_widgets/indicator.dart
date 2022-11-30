import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:info_keeper/const/colors.dart';

class Indicator extends StatelessWidget {
  final int length, activeIndex;
  const Indicator({Key? key, required this.length, required this.activeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(length, (index) {
          if (index == activeIndex) {
            print(activeIndex);
            return Container(
              height: 7.h,
              width: 15.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: primaryColor,
              ),
            );
          }
          return Container(
            height: 7.w,
            width: 7.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor.withAlpha(76),
            ),
          );
        }),
      ),
    );
  }
}
