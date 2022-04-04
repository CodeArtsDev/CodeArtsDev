import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primary = Color(0xFF436892);
const Color primaryTextColor = Colors.black;
const Color primaryLight = Color(0xFF5789B5);
const Color textPrimary = Color(0xFF000000);
const Color textPrimaryLight = Color(0xFF9E9E9E);
const Color background = Color(0xFFEEEEEE);
const Color disabledColor = Color(0xFF9E9E9E);
const Color disabledColorLight = Color(0xFFEEEEEE);
const Color white = Color(0xFFFFFFFF);
const Color green = Color(0xFF66BB6A);
const Color red = Color(0xFFEF5350);
const Color yellow = Color(0xFFF4E425);
const Color greenLight = Color(0xFFEDF7EF);
const Color redBackground = Color(0xFFFEF5F5);

const ColorScheme _colorScheme = ColorScheme(
  primary: primary,
  secondary: primary,
  surface: white,
  background: background,
  error: red,
  onPrimary: white,
  onSecondary: textPrimary,
  onSurface: textPrimary,
  onBackground: textPrimary,
  onError: white,
  brightness: Brightness.light,
);

ThemeData _baseTheme = ThemeData.light();

final ThemeData kkTheme = _baseTheme.copyWith(
    colorScheme: _colorScheme,
    toggleableActiveColor: primary,
    primaryColor: primary,
    primaryColorLight: primaryLight,
    primaryColorDark: primary,
    scaffoldBackgroundColor: background,
    disabledColor: textPrimaryLight,
    backgroundColor: white,
    cardColor: white,
    errorColor: red,
    primaryIconTheme: _customIconTheme(_baseTheme.iconTheme),
    iconTheme: _customIconTheme(_baseTheme.iconTheme),
    textTheme: _getTextTheme(_baseTheme.textTheme),
    inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: primary))));

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: primaryLight);
}

TextTheme _getTextTheme(TextTheme baseTextTheme) {
  return baseTextTheme.copyWith(
    headline1: GoogleFonts.roboto(
        fontSize: 102,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.2,
        color: primaryTextColor),
    headline2: GoogleFonts.roboto(
        fontSize: 64,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.15,
        color: primaryTextColor),
    headline3: GoogleFonts.roboto(
        fontSize: 51,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: primaryTextColor),
    headline4: GoogleFonts.roboto(
        fontSize: 36,
        letterSpacing: 0,
        fontWeight: FontWeight.w700,
        color: primaryTextColor),
    headline5: GoogleFonts.roboto(
        fontSize: 25,
        letterSpacing: 0,
        fontWeight: FontWeight.w700,
        color: primaryTextColor),
    headline6: GoogleFonts.roboto(
        fontSize: 21,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        color: primaryTextColor),
    subtitle1: GoogleFonts.roboto(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: primaryTextColor),
    subtitle2: GoogleFonts.roboto(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: primaryTextColor),
    bodyText1: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: primaryTextColor),
    bodyText2: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        height: 1.4,
        color: primaryTextColor),
    button: GoogleFonts.roboto(
        fontSize: 13, letterSpacing: 0.15, fontWeight: FontWeight.w500),
    caption: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: primaryTextColor),
    overline: GoogleFonts.roboto(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: primaryTextColor),
  );
}
