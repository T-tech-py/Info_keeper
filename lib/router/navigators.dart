import 'package:flutter/material.dart';

navigateReplaces(context, Widget route,
    {isDialog = false, RouteSettings? routeSettings}) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (BuildContext ctx) => route, settings: routeSettings),
  );
}

Future navigate(BuildContext context, Widget route,
        {isDialog = false, RouteSettings? routeSettings}) async =>
    Navigator.push(
      context,
      MaterialPageRoute(
          maintainState: false,
          fullscreenDialog: isDialog,
          builder: (context) => route,
          settings: routeSettings),
    );

popToFirst(BuildContext context) =>
    Navigator.of(context).popUntil((route) => route.isFirst);

popView(BuildContext context) => Navigator.pop(context);

navigateTransparentRoute(BuildContext context, Widget route) {
  return Navigator.push(
    context,
    TransparentRoute(
      builder: (context) => route,
    ),
  );
}

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    required this.builder,
    this.routeSettings,
  })  : assert(builder != null),
        super(fullscreenDialog: false, settings: routeSettings);

  final WidgetBuilder builder;
  final RouteSettings? routeSettings;

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: SlideTransition(
          transformHitTests: false,
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0, -1.0),
            ).animate(secondaryAnimation),
            child: result,
          ),
        ),
      ),
    );
  }
}
