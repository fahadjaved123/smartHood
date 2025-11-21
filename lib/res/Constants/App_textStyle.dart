import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle heading(
    double fontSize, {
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.white,
    double height = 0,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.abel(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      fontStyle: fontStyle,
    );
  }


}
