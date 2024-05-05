import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color blackColor = const Color(0xff424242);
Color defBlue = const Color(0xff54D4DA);
Color lightDefBlue = const Color(0xffF6F9FC);
Color lightGrey = const Color(0xffD4DADB);
Color grey = const Color(0xffB3B3B3);
Color deactiveIcon = const Color(0xffAFAFAF);
Color burnWhite = const Color(0xffF6F0FF);
Color normalWhite = const Color(0xffFFFFFF);
Color basicYellow = const Color(0xffF8C952);
Color statusGreen = const Color(0xff64FAA0);
Color statusRed = const Color(0xffF85252);
const String my_app_name = "SIRAJA";
const double defaultEdgeInsetScreen = 25.0;

TextStyle getDefaultTextStyle(
    {double? font_size, FontWeight? font_weight, Color? font_color}) {
  TextStyle blackTextStyle = GoogleFonts.poppins(
      fontWeight: font_weight ?? FontWeight.w500,
      color: font_color ?? blackColor,
      fontSize: font_size ?? 12);

  return blackTextStyle;
}

EdgeInsetsGeometry getDefaultPaddingScreen() {
  return EdgeInsets.symmetric(horizontal: defaultEdgeInsetScreen);
}