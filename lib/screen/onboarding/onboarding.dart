// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/const/sizedbox.dart';
import 'package:info_keeper/widget/button.dart';
import '../../widget/onboarding_widgets/indicator.dart';
import '../../widget/onboarding_widgets/intro_view.dart';

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
      backgroundColor: bodyColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ySize(170),
            Expanded(
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
            ySize(25),
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
            ySize(15),
            Indicator(length: 3, activeIndex: _currentPage),
            ySize(50),
          ],
        ),
      ),
    );
  }
}
