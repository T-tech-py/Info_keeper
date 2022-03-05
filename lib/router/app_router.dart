// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:info_keeper/screen/authentication/forgetPin1.dart';
import 'package:info_keeper/screen/authentication/forgetPin2.dart';
import 'package:info_keeper/screen/authentication/login.dart';
import 'package:info_keeper/screen/authentication/newPin.dart';
import 'package:info_keeper/screen/authentication/otp.dart';
import 'package:info_keeper/screen/dashboard/addinfo.dart';
import 'package:info_keeper/screen/dashboard/dashboard.dart';
import 'package:info_keeper/screen/dashboard/editInfo.dart';
import 'package:info_keeper/screen/dashboard/fileDeleted.dart';
import 'package:info_keeper/screen/dashboard/infoView.dart';
import 'package:info_keeper/screen/dashboard/landing.dart';
import 'package:info_keeper/screen/dashboard/recent.dart';
import 'package:info_keeper/screen/onboarding/onboarding.dart';

import '../screen/authentication/signup.dart';

class AppRouting {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/onboardingScreen':
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case '/otpScreen':
        return MaterialPageRoute(builder: (_) => OtpScreen());
      case '/forgetPin1':
        return MaterialPageRoute(builder: (_) => ForgetPin1());
      case '/forgetPin2':
        return MaterialPageRoute(builder: (_) => ForgetPin2());
      case '/newPin':
        return MaterialPageRoute(builder: (_) => PinReset());
      case '/landing':
        return MaterialPageRoute(builder: (_) => LandingScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/recent':
        return MaterialPageRoute(builder: (_) => Recent());
      case '/infoView':
        return MaterialPageRoute(builder: (_) => InfoView());
      case '/editinfoView':
        return MaterialPageRoute(builder: (_) => EditInfoView());
      case '/addnewfile':
        return MaterialPageRoute(builder: (_) => AddNewFile());
      case '/filedeleted':
        return MaterialPageRoute(builder: (_) => FileDeleted());
      default:
        return null;
    }
  }
}
