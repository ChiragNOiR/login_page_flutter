import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color primaryColor = Colors.white;
  static Color secondaryColor = Colors.purple.shade900;
  static Color h1Color = const Color(0xFF403B36);
  static Color h2Color = const Color(0xFF595550);
  static Color textColor = const Color(0xFF403B36);

  static TextStyle boldText = GoogleFonts.roboto(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  static TextStyle tText = GoogleFonts.roboto(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: textColor,
  );
}
