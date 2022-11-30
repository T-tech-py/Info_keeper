import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/router/app_router.dart';
import 'package:info_keeper/router/navigator_keys.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final GlobalKey _secondKey = GlobalKey<NavigatorState>();

  final AppRouting appRouting = AppRouting();

  Widget _buildBody() {
    //Refactor the Navigator widgets into a seperateWidget if you can;
    return WillPopScope(
      onWillPop: () async {
        if (firstKey.currentState!.canPop()) {
          firstKey.currentState!.maybePop();
          return Future<bool>.value(false);
        }
        return Future<bool>.value(true);
      },
      child: Navigator(
        key: firstKey,
        onGenerateRoute: appRouting.onGenerateRoute,
        initialRoute: '/dashboard',

        // onPopPage not necessary
        onPopPage: (Route route, dynamic result) {
          if (!route.didPop(result)) {
            return false;
          }
          return true;
        },
      ),
    );
  }

  var key = 'dashboard';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawerEnableOpenDragGesture: false,
        body: _buildBody(),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 6.0,
          // shape: const CircularNotchedRectangle(),
          color: Color(0xffF6FAFE),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            height: 79.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  return Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      if (key == "dashboard")
                        Container(
                          height: 2.h,
                          width: 36.w,
                          color: primaryColor,
                        ),
                      CustomNavItem(
                        icon: key == "dashboard"
                            ? "assets/image/svg/home.svg"
                            : "assets/image/svg/unfillhome.svg",
                        label: 'Home',
                        onTap: () {
                          firstKey.currentState!.pushNamed('/dashboard',
                              arguments: (route) => false);
                          setState(() {
                            key = "dashboard";
                          });
                        },
                        color: key == "dashboard" ? primaryColor : black,
                      ),
                    ],
                  );
                }),
                Builder(builder: (context) {
                  return Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      if (key == "recent")
                        Container(
                          height: 2.h,
                          width: 36.w,
                          color: primaryColor,
                        ),
                      CustomNavItem(
                        icon: key == "recent"
                            ? "assets/image/svg/recentFill.svg"
                            : "assets/image/svg/recent.svg",
                        label: 'Recent',
                        onTap: () {
                          setState(() {
                            key = "recent";
                          });
                          firstKey.currentState!.pushNamed('/recent',
                              arguments: (route) => false);
                        },
                        color: key == "recent" ? primaryColor : black,
                      ),
                    ],
                  );
                }),
                Builder(builder: (context) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      if (key == "profile")
                        Container(
                          height: 2.h,
                          width: 36.w,
                          color: primaryColor,
                        ),
                      CustomNavItem(
                        icon: "assets/image/svg/profile.svg",
                        label: 'Profile',
                        onTap: () {
                          setState(() {
                            key = "profile";
                          });
                          firstKey.currentState!.pushNamed('/profile',
                              arguments: (route) => false);
                        },
                        color: key == "profile" ? primaryColor : black,
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNavItem extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;
  const CustomNavItem(
      {Key? key,
      required this.icon,
      required this.label,
      this.onTap,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            color: color,
          ),
          SizedBox(height: 9.h),
          Text(
            label,
            style: GoogleFonts.josefinSans(fontSize: 14, color: color),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final List<CustomNavBarItem> items;
  final ValueChanged<int>? onChanged;
  final int? currentIndex;

  const CustomBottomNavigationBar(
      {Key? key, required this.items, this.onChanged, this.currentIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(items.length, (index) {
        var item = items[index];
        return InkWell(
            onTap: () {
              onChanged?.call(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: item..active = currentIndex == index,
            ));
      }),
    );
  }
}

class CustomNavBarItem extends StatelessWidget {
  final Widget activeIcon;
  bool isActive;
  final Widget? inactiveIcon;

  set active(bool value) => isActive = value;

  CustomNavBarItem({
    Key? key,
    required this.activeIcon,
    this.inactiveIcon,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isActive ? activeIcon : inactiveIcon ?? activeIcon;
  }
}
