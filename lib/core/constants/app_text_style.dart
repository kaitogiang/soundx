import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTexStyle {
  static TextStyle textSize12({
    Color textColor = Colors.black,
    double fontSize = 12.0,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  static TextStyle textSize16({
    Color textColor = Colors.black,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
