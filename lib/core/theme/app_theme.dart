import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xffFAFAFA),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        headlineMedium: GoogleFonts.poppins(
          fontSize: 26,
          fontWeight: FontWeight.w500,
          color: Color(0xff000000),
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xff000000),
        ),
        bodyMedium: GoogleFonts.poppins(fontSize: 14, color: Color(0xff666666)),
        labelLarge: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xffFFFFFF),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(Color(0xff173EA5)),
          textStyle: WidgetStatePropertyAll(
            GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xff173EA5),
            ),
          ),
          foregroundColor: const WidgetStatePropertyAll(Color(0xff173EA5)),
        ),
      ),
      primaryColor: Color(0xff173EA5),
      useMaterial3: true,
    );
  }
}
