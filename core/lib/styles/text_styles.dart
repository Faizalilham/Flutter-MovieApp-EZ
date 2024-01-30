import 'package:core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///style text
// ignore: non_constant_identifier_names
final TextStyle Heading5 =
    GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400);
// ignore: non_constant_identifier_names
final TextStyle Heading6 = GoogleFonts.poppins(
    fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15);
final TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);
final TextStyle bodyText = GoogleFonts.poppins(
    fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);

///text theme
final textTheme = TextTheme(
  headline5: Heading5,
  headline6: Heading6,
  subtitle1: subtitle,
  bodyText2: bodyText,
);

const kColorScheme = ColorScheme(
    primary: kGreen,
    secondary: kGreen2,
    surface: kRichBlack,
    background: kRichBlack,
    error: Colors.red,
    onPrimary: kRichBlack,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.dark);
