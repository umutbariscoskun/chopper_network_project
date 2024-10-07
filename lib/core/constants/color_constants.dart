import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color dodgerBlue = Color(0xff1FA2FF);
  static const Color vividSkyBlue = Color(0xff12D8FA);
  static const Color magicMint = Color(0xffA6FFCB);
  static const Color textColor = Color(0xff36394A);
  static const Color white = Colors.white;

  static const dodgerGradient2 = LinearGradient(
    begin: Alignment(0.42, 1),
    end: Alignment(1, 0.5),
    colors: [
      Color.fromRGBO(31, 163, 255, 1),
      Color.fromRGBO(18, 217, 250, 1),
      Color.fromRGBO(166, 255, 204, 1),
    ],
    stops: [0.00, 0.50, 1.00],
  );
}
