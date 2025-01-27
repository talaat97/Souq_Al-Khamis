import 'package:flutter/material.dart';

class AppColor {
  static const Color black = Color.fromARGB(239, 0, 0, 0);
  static const Color white = Color.fromARGB(255, 255, 252, 252);
  static const Color grey = Color.fromARGB(255, 46, 46, 46);
  static Color? grey200 = Colors.grey[200];
  static Color? grey600 = Colors.grey[600];
  static const Color primaryColor = Color.fromARGB(255, 219, 103, 25);
  static const Color redColor = Color.fromARGB(255, 179, 34, 24);
  static const Color secondColor = Color.fromARGB(255, 139, 64, 29);
  static Color thirdColor = primaryColor.withValues(alpha: 0.5);
}
