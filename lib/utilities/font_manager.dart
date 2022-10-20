import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/utilities/app_colors.dart';

class FontConstants {
  static const String fontFamily = 'Noor';
}

class FontWightManager {
  static const FontWeight light = FontWeight.w400;
  static const FontWeight regular = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
}

TextStyle headerTextStyle = GoogleFonts.poppins(
    color: black, fontSize: FontSize.s20, fontWeight: FontWightManager.bold);
TextStyle bodyTextStyle = GoogleFonts.poppins(
    color: black, fontSize: FontSize.s16, fontWeight: FontWightManager.regular);
TextStyle smallTextStyle = GoogleFonts.poppins(
    color: black,
    fontSize: FontSize.s14,
    fontWeight: FontWightManager.semiBold);
