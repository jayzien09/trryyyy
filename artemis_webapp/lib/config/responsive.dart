import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Widget smallMobile;

  const Responsive(
      {required Key key,
      required this.mobile,
      required this.tablet,
      required this.desktop,
      required this.smallMobile})
      : super(key: key);

  // This isMobile, isTablet, isDesktop
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200 &&
      MediaQuery.of(context).size.width >= 768;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1500;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If width is more than 1200, it is desktop
    if (size.width >= 1200) {
      return desktop;
    }
    // If width is less than 1200 and more then 768, it is tablet
    else if (size.width >= 768 && tablet != null) {
      return tablet;
    }
    // If less than 768, it is mobile
    else if (size.width >= 376 && size.width <= 768 && mobile != null) {
      return mobile;
    } else {
      return smallMobile;
    }
  }
}
