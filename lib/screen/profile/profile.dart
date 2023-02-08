import 'package:audioplayers/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/sizedbox.dart';
import 'package:info_keeper/router/app_router.dart';
import 'package:info_keeper/router/navigators.dart';
import 'package:info_keeper/screen/authentication/login.dart';
import 'package:info_keeper/screen/notification/notification.dart';
import 'package:info_keeper/screen/profile/contact.dart';
import 'package:info_keeper/screen/profile/personal_info.dart';
import 'package:info_keeper/screen/profile/pin_settings.dart';
import 'package:info_keeper/screen/profile/settings.dart';

import '../../const/colors.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          height: 90.h,
          decoration: BoxDecoration(color: white, boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: const Offset(0, 4),
                blurRadius: 4.5.h)
          ]),
          padding: EdgeInsets.only(top: 30.h),
          alignment: Alignment.center,
          child: Text(
            "Profile",
            style: GoogleFonts.josefinSans(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ySize(32),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          const AssetImage("assets/image/png/profile.png"),
                      radius: 50.r,
                    ),
                    Positioned(
                      right: -2,
                      bottom: 2.h,
                      child: Container(
                        padding: EdgeInsets.all(1.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                        ),
                        child: Icon(
                          Icons.add_circle,
                          color: primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ySize(12),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Ayola Lanre",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
              ),
              ySize(32),
              ProfileCard(
                onTap: () => navigate(context, const PersonalInformation()),
                svg: 'profile',
                text: 'Personal Information',
              ),
              ySize(12),
              ProfileCard(
                onTap: () => navigate(context, const Settings()),
                svg: 'settings',
                text: 'Account Settings',
              ),
              ySize(12),
              ProfileCard(
                onTap: () => navigate(context, const PinSettings()),
                svg: 'lock',
                text: 'Pin',
              ),
              ySize(12),
              ProfileCard(
                onTap: () => navigate(context, const Notifications()),
                svg: 'notification',
                text: 'Notifications',
              ),
              ySize(12),
              ProfileCard(
                onTap: () => navigate(context, const ContactUs()),
                svg: 'call',
                text: 'Contact Us',
              ),
              ySize(12),
              ProfileCard(
                onTap: () =>
                    Navigator.popUntil(context, ModalRoute.withName('/login')),
                svg: 'sign_out',
                text: 'Sign Out',
              ),
              ySize(20),
            ],
          ),
        )
      ]),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.onTap,
    required this.text,
    required this.svg,
  }) : super(key: key);
  final Function() onTap;
  final String text;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
        decoration: BoxDecoration(
          color: bodyColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/image/svg/$svg.svg",
              color: primaryColor,
            ),
            xSize(8),
            Text(
              text,
              style: GoogleFonts.josefinSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: black,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
