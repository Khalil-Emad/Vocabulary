import 'package:flutter/material.dart';

class ColorsManager {
  ///* Transparent colors
  static const Color transparent = Colors.transparent;

  static const Color white = Color(0xFFFFFFFF);
  static Color buttonColor = hexToColor("#95c1c1");
  static Color backgroundColor = hexToColor("#262626");
  static Color inputColor = hexToColor("#333233");
  static Color hintTextColor = hexToColor("#787979");
  static Color whiteColor = Colors.white;
  static const Color black = Color(0xFF000000);

  static Color hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor; // Add alpha value if missing
    }
    int hexValue = int.parse(hexColor, radix: 16);
    return Color(hexValue);
  }

}
