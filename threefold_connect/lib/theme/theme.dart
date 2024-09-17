import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
const primaryColor = Color(0xFF1AA18F);
const secondaryColor = Color(0xFF212121);
const tertiaryColor = Color(0xFF74DDC3);
const backgroundColor = Color(0xFF383434);
const white = Color(0xFFFFFFFF);
const darkred = Color(0xFFA11A1A);
const grey = Color(0xFF818181);
const backgroundGrey = Color(0xFF323232);


// Fonts
var poppins = GoogleFonts.poppins().fontFamily;
var inter = GoogleFonts.inter().fontFamily;
var interBold = GoogleFonts.inter(fontWeight: FontWeight.bold).fontFamily;

ThemeData threefoldTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    titleTextStyle: TextStyle(
      color: white,
    ),
    iconTheme: IconThemeData(
      color: white,
    ),
  ),
  primaryColor: primaryColor,
  iconTheme: const IconThemeData(color: white),
  fontFamily: GoogleFonts.notoSans().fontFamily,
  scaffoldBackgroundColor: backgroundColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: backgroundColor,
    primary: primaryColor,
    secondary: secondaryColor,
    tertiary: tertiaryColor,
    surfaceTint: Colors.transparent,
  ),
  textTheme: const TextTheme(headlineMedium: TextStyle(color: white)),
);
