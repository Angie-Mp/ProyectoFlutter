import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FontStyles {
  static final TextTheme textTheme = GoogleFonts.openSansTextTheme();

  static final title = GoogleFonts.openSans(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: const Color(0XFF363636),
    fontStyle: FontStyle.normal,
  );
  static final title2 = GoogleFonts.openSans(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: const Color(0XFF6B6B6B),
    fontStyle: FontStyle.normal,
  );
  static final subtitle = GoogleFonts.openSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: const Color(0XFF6B6B6B),
    fontStyle: FontStyle.normal,
  );
  static final regular = GoogleFonts.openSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: const Color(0XFF363636),
    fontStyle: FontStyle.normal,
  );
}
