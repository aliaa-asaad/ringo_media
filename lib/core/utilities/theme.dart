import 'package:flutter/material.dart';
import 'package:ringo_media/core/utilities/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.black),
    //scaffoldBackgroundColor: Colors.transparent,
    fontFamily: 'Urbanist',
    colorScheme: const ColorScheme.light(
      primary: CutsomColors.neutralColor900,
      secondary: CutsomColors.neutralColor800,
      //background: Colors.black,
      brightness: Brightness.light,
      primaryContainer: Colors.white,
      secondaryContainer: Color(0xfff9f2d5),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff181A20),
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: const ColorScheme.dark(
      background: Colors.white,
      primaryContainer: Color(0xff1F222A),
      primary: Color(0xfff9f2d5),
      secondary: Color(0xffd6bf97),
      brightness: Brightness.dark,
      // background: Colors.
    ),
  );
}
