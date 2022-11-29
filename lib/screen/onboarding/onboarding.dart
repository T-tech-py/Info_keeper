// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/widget/button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 170.h),
            SizedBox(
              height: 447.h,
              child: PageView(
                controller: _pageController,
                onPageChanged: (pageIndex) {
                  setState(() {
                    _currentPage = pageIndex;
                  });
                },
                children: const [
                  IntroView(
                      imgLink: "assets/image/svg/onboarding1.svg",
                      text1: "SAVE DOCUMENTS",
                      text2:
                          "Keep importants documents and access them anytime."),
                  IntroView(
                      imgLink: "assets/image/svg/onboarding2.svg",
                      text1: "MORE THAN TEXTS",
                      text2:
                          "Add audio recordings and images to your documents."),
                  IntroView(
                      imgLink: "assets/image/svg/onboarding3.svg",
                      text1: "CLOUD STORAGE",
                      text2:
                          "Gain access to documents from any device at anytime.")
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoginButton(
                  text: _currentPage < 2 ? 'SKIP' : 'LOGIN',
                  onPressed: () {
                    if (_currentPage < 2) {
                      setState(() {
                        _currentPage = 3;
                        _pageController.jumpToPage(3);
                      });
                    } else if (_currentPage >= 2) {
                      Navigator.pushNamed(context, "/login");
                    }
                  },
                  isLogin: false,
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoginButton(
                  text: _currentPage < 2 ? 'NEXT' : 'CREATE ACCOUNT',
                  onPressed: () {
                    if (_currentPage < 2) {
                      setState(() {
                        _pageController.nextPage(
                            duration: Duration(microseconds: 2000),
                            curve: Curves.easeOutBack);
                        _currentPage++;
                      });
                    } else if (_currentPage >= 2) {
                      Navigator.pushNamed(context, "/signup");
                    }
                  },
                  isLogin: true,
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Indicator(length: 3, activeIndex: _currentPage),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}

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

class IntroView extends StatelessWidget {
  const IntroView(
      {Key? key,
      required this.imgLink,
      required this.text1,
      required this.text2})
      : super(key: key);
  final String imgLink;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          imgLink,
          height: 280.h,
          width: 310.w,
        ),
        SizedBox(height: 50.h),
        Text(
          text1,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: black.withOpacity(0.7),
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
