// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/widget/button.dart';
import 'package:info_keeper/widget/customTextField.dart';
import 'package:info_keeper/widget/formField.dart';

class EditInfoView extends StatefulWidget {
  const EditInfoView({Key? key}) : super(key: key);

  @override
  _EditInfoViewState createState() => _EditInfoViewState();
}

class _EditInfoViewState extends State<EditInfoView> {
  TextEditingController discriptionText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    discriptionText.text = 938429728792.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        primary: true,
        elevation: 0.5,
        titleSpacing: 7,
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: SvgPicture.asset("assets/image/svg/back.svg",
                  width: 30.w, height: 30.w),
            )),
        title: Text(
          "Edit",
          style: GoogleFonts.josefinSans(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            color: black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            SizedBox(height: 56.h),
            CustomTextField(label: 'Title', hintText: "My Nin"),
            SizedBox(height: 24.h),
            CustomFormField(
              label: "Description",
              hintText: '72728172811',
              controller: discriptionText,
            ),
            SizedBox(height: 24.h),
            Text(
              "Images",
              style: GoogleFonts.josefinSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: black,
              ),
            ),
            SizedBox(height: 18.h),
            SizedBox(
              height: 150.h,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext, int) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 90.h,
                        width: 90.h,
                        color: Colors.grey,
                      ),
                    );
                  }),
            ),
            SizedBox(height: 18.h),
            Text(
              "Audio ",
              style: GoogleFonts.josefinSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: black,
              ),
            ),
            SizedBox(height: 18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 44.h,
                  width: 295.w,
                  decoration: BoxDecoration(
                      color: Color(0xffF1F5F8),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.play_circle_fill)),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.05,
                          backgroundColor: Colors.grey,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(width: 18.w),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset('assets/image/svg/bin.svg')),
              ],
            ),
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.attach_file)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
                IconButton(onPressed: () {}, icon: Icon(Icons.mic_none))
              ],
            ),
            SizedBox(height: 40.h),
            LoginButton(text: "Save", onPressed: () {}, isLogin: true),
            SizedBox(height: 44.h),
          ],
        ),
      ),
    );
  }
}
