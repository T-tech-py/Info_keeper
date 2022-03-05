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

class InfoView extends StatefulWidget {
  const InfoView({Key? key}) : super(key: key);

  @override
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
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
          "My Nin",
          style: GoogleFonts.josefinSans(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            color: black,
          ),
        ),
        actions: [
          // PopupMenuButton(itemBuilder: ((_)=>[

          //   PopupMenuItem(child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     children: [
          //                       SvgPicture.asset('assets/image/svg/edit.svg'),
          //                       Text(
          //                         "Edit",
          //                         style: GoogleFonts.josefinSans(
          //                           fontSize: 14.sp,
          //                           fontWeight: FontWeight.w400,
          //                           color: black,
          //                         ),
          //                       ),
          //                     ])),

          // ])),
          GestureDetector(
              onTap: () {
                showMenu(
                    context: context,
                    useRootNavigator: true,
                    position: RelativeRect.fromLTRB(300, 70, 0, 0),
                    items: [
                      PopupMenuItem(
                          onTap: () {
                            Navigator.pushNamed(context, '/editinfoView');
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset('assets/image/svg/edit.svg'),
                                Text(
                                  "Edit",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: black,
                                  ),
                                ),
                              ])),
                      PopupMenuItem(
                          onTap: () {
                            Future.delayed(Duration(seconds: 0), () {
                              showDialog(
                                  context: context,
                                  builder: ((context) => Dialog()));
                            });
                            // setState(() {

                            // });
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset('assets/image/svg/bin.svg'),
                                Text(
                                  "Delete",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.red,
                                  ),
                                ),
                              ]))
                    ]);
              },
              child: Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: SvgPicture.asset(
                  'assets/image/svg/menu.svg',
                  color: black,
                ),
              ))
        ],
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
              ],
            ),
            SizedBox(height: 40.h),
            LoginButton(text: "Close", onPressed: () {}, isLogin: true),
            SizedBox(height: 44.h),
          ],
        ),
      ),
    );
  }
}

class Dialog extends StatelessWidget {
  const Dialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 298.w,
            height: 498.h,
            padding: EdgeInsets.fromLTRB(24.w, 92.h, 24.w, 0.h),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Image.asset("assets/image/png/bins.png"),
                SizedBox(height: 33.h),
                Text(
                  "Sure to Delete?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 22.h),
                Text(
                  "You will not be able to recover Info ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  " after delete.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 75.h),
                Row(
                  children: [
                    Expanded(
                        child: DeleteButton(
                      textColor: black,
                      text: 'NO, CANCEL',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      containerColor: white,
                      border: true,
                    )),
                    SizedBox(width: 25.h),
                    Expanded(
                        child: DeleteButton(
                      textColor: white,
                      text: 'YES, DELETE',
                      onTap: () {
                        Navigator.pushNamed(context, '/filedeleted');
                      },
                      containerColor: Colors.red,
                      border: false,
                    )),
                  ],
                )
              ],
            )));
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.containerColor,
    required this.border,
    required this.textColor,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final Color containerColor;
  final bool border;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 123.w,
        height: 44.h,
        decoration: BoxDecoration(
          border:
              border ? Border.all(color: black) : Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(16),
          color: containerColor,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.josefinSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
