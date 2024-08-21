import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
const primaryColor = Color(0xFF212121);
const secondryColor = Color(0xFF1AA18F);
const teritaryColor = Color(0xFF74DDC3);
const backgroundColor = Color(0xFF484848);
const white = Color(0xFFFFFFFF);
const darkred = Color(0xFFA11A1A);
const grey = Color(0xFF818181);

// Fonts
var poppins = GoogleFonts.poppins().fontFamily;
var inter = GoogleFonts.inter().fontFamily;
var interBold = GoogleFonts.inter(fontWeight: FontWeight.bold).fontFamily;

ThemeData threefoldTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: secondryColor,
    titleTextStyle: TextStyle(
      color: white,
    ),
    iconTheme: IconThemeData(
      color: white,
    ),
  ),
  fontFamily: GoogleFonts.notoSans().fontFamily,
  scaffoldBackgroundColor: backgroundColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: backgroundColor,
    primary: primaryColor,
    secondary: secondryColor,
    tertiary: teritaryColor,
    surfaceTint: Colors.transparent,
  ),
  textTheme: const TextTheme(headlineMedium: TextStyle(color: white)),
);
