import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color.fromRGBO(255, 94, 102, 1);

TextStyle get heading {
  return GoogleFonts.aBeeZee(
      fontSize: 26, fontWeight: FontWeight.w700, color: Colors.black);
}

TextStyle get subTitle {
  return GoogleFonts.aBeeZee(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.grey);
}

TextStyle get titleStyle {
  return GoogleFonts.aBeeZee(
      fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black);
}
TextStyle get smallTitleStyle {
  return GoogleFonts.aBeeZee(
      fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white);
}
