// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ignore: must_call_super
  void initState() {
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushNamed(context, "/onboardingScreen");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: AnimatedContainer(
          duration: Duration(minutes: 2),
          child: Text(
            "Infokeeper",
            style: GoogleFonts.josefinSans(
              color: white,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
