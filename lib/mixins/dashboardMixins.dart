import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/const/sizedbox.dart';
import 'package:info_keeper/screen/dashboard/addinfo.dart';
import 'package:info_keeper/screen/dashboard/dashboard.dart';
import 'package:info_keeper/screen/dashboard/infoView.dart';
import 'package:info_keeper/widget/file.dart';
import 'package:wave_transition/wave_transition.dart';

class Dassboardlogic {
  List numbersOfAddedFiles = [
    1,
    2,
    4,
    7,
  ];

  Widget fileHandler(BuildContext context, Enum value) {
    numbersOfAddedFiles.insert(0, 1);
    if (numbersOfAddedFiles.length == 1) {
      return AddFileWidget(
        isVertical: value == View.horizontal ? false : true,
      );
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      child: value == View.vertical
          ? ListView.builder(
              itemCount: numbersOfAddedFiles.length,
              itemBuilder: (context, index) => index == 0
                  ? AddFileWidget(
                      isVertical: value == View.horizontal ? false : true,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyFile(
                        title: "My NIN",
                        onTap: () {
                          Navigator.push(
                              context,
                              WaveTransition(
                                  child: InfoView(),
                                  duration: Duration(seconds: 2),
                                  center: FractionalOffset(0.90, 0.90)));
                        },
                        isVertical: value == View.horizontal ? false : true,
                      ),
                    ))
          : GridView.builder(
              itemCount: numbersOfAddedFiles.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return index == 0
                    ? AddFileWidget(
                        isVertical: value == View.horizontal ? false : true,
                      )
                    : MyFile(
                        title: "My NIN",
                        onTap: () {
                          Navigator.push(
                              context,
                              WaveTransition(
                                  child: InfoView(),
                                  duration: Duration(seconds: 2),
                                  center: FractionalOffset(0.90, 0.90)));
                        },
                        isVertical: value == View.horizontal ? false : true,
                      );
              }),
    );
  }
}

class AddFileWidget extends StatelessWidget {
  const AddFileWidget({
    Key? key,
    required this.isVertical,
  }) : super(key: key);
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            WaveTransition(
                child: AddNewFile(),
                duration: const Duration(seconds: 1),
                center: const FractionalOffset(0.90, 0.90)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(10.r)),
        child: isVertical
            ? Row(
                children: [
                  SvgPicture.asset("assets/image/svg/newfile.svg"),
                  xSize(12),
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
              )
            : Column(
                children: [
                  SvgPicture.asset("assets/image/svg/newfile.svg"),
                  ySize(12),
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
    );
  }
}
