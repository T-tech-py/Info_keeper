import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:info_keeper/const/theme.dart';
import 'package:info_keeper/router/app_router.dart';
import 'package:info_keeper/screen/onboarding/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  final AppRouting appRouting = AppRouting();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () {
          return MaterialApp(
            theme: context.themeData,
            home: const SplashScreen(),
            showPerformanceOverlay: false,
            onGenerateRoute: appRouting.onGenerateRoute,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
