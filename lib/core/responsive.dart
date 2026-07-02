import 'package:flutter/cupertino.dart';

class Responsive {
  static bool isMobile(context) => MediaQuery.of(context).size.width < 700;

  static bool isTablet(context) =>
      MediaQuery.of(context).size.width >= 700 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(context) => MediaQuery.of(context).size.width >= 1100;
}
