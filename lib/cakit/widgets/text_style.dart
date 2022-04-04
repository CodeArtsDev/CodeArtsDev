import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum CaTextSize {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  sh1,
  sh2,
  b1,
  b2,
  button,
  caption,
  overline
}

class CaTextStyle {
  static Function _fontFamily = GoogleFonts.ibmPlexSans;

  static Map<int, FontWeight> _defaultFontWeight = {
    100: FontWeight.w100,
    200: FontWeight.w200,
    300: FontWeight.w300,
    400: FontWeight.w300,
    500: FontWeight.w400,
    600: FontWeight.w500,
    700: FontWeight.w600,
    800: FontWeight.w700,
    900: FontWeight.w800,
  };

  static Map<CaTextSize, double> _defaultTextSize = {
    CaTextSize.h1: 102,
    CaTextSize.h2: 64,
    CaTextSize.h3: 51,
    CaTextSize.h4: 36,
    CaTextSize.h5: 25,
    CaTextSize.h6: 21,
    CaTextSize.sh1: 17,
    CaTextSize.sh2: 15,
    CaTextSize.b1: 16,
    CaTextSize.b2: 14,
    CaTextSize.button: 13,
    CaTextSize.caption: 12,
    CaTextSize.overline: 10,
  };

  static final Map<CaTextSize, double> _defaultLetterSpacing = {
    CaTextSize.h1: -0.2,
    CaTextSize.h2: -0.15,
    CaTextSize.h3: 0,
    CaTextSize.h4: 0,
    CaTextSize.h5: 0,
    CaTextSize.h6: 0,
    CaTextSize.sh1: 0.15,
    CaTextSize.sh2: 0.15,
    CaTextSize.b1: 0.15,
    CaTextSize.b2: 0.15,
    CaTextSize.button: 0.15,
    CaTextSize.caption: 0.15,
    CaTextSize.overline: 0.15,
  };

  static TextStyle getStyle(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double letterSpacing = 0.15,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    double? finalFontSize = fontSize ?? textStyle?.fontSize;

    Color? finalColor;
    if (color == null) {
      Color themeColor = Colors.black;
      finalColor = xMuted
          ? themeColor.withAlpha(160)
          : (muted ? themeColor.withAlpha(200) : themeColor);
    } else {
      finalColor = xMuted
          ? color.withAlpha(160)
          : (muted ? color.withAlpha(200) : color);
    }

    return _fontFamily(
        fontSize: finalFontSize,
        fontWeight: _defaultFontWeight[fontWeight] ?? FontWeight.w400,
        letterSpacing: letterSpacing,
        color: finalColor,
        decoration: decoration,
        height: height,
        wordSpacing: wordSpacing);
  }

  static TextStyle h1(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CaTextSize.h1],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CaTextSize.h1] ?? -0.2,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle h2(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CaTextSize.h2],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CaTextSize.h2] ?? -0.15,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle h3(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CaTextSize.h3],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CaTextSize.h3] ?? -0.15,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle h4(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CaTextSize.h4],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CaTextSize.h4] ?? 0,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle h5(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CaTextSize.h5],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CaTextSize.h5] ?? 0,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle h6(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CaTextSize.h6],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CaTextSize.h6] ?? 0,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle sh1(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CaTextSize.sh1],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CaTextSize.sh1] ?? 0.15,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle sh2(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CaTextSize.sh2],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CaTextSize.sh2] ?? 0.15,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle b1(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CaTextSize.b1],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CaTextSize.b1] ?? 0.15,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle b2(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CaTextSize.b2],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CaTextSize.b2] ?? 0.15,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle button(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CaTextSize.button],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CaTextSize.button] ?? 0.15,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle caption(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing = 0,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CaTextSize.caption],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CaTextSize.caption] ?? 0.15,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle overline(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CaTextSize.overline],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CaTextSize.overline] ?? 0.15,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static void changeFontFamily(Function fontFamily) {
    CaTextStyle._fontFamily = fontFamily;
  }

  static void changeDefaultFontWeight(Map<int, FontWeight> defaultFontWeight) {
    CaTextStyle._defaultFontWeight = defaultFontWeight;
  }

  static void changeDefaultTextSize(Map<CaTextSize, double> defaultTextSize) {
    CaTextStyle._defaultTextSize = defaultTextSize;
  }

  static Map<CaTextSize, double> get defaultTextSize => _defaultTextSize;

  static Map<CaTextSize, double> get defaultLetterSpacing =>
      _defaultLetterSpacing;

  static Map<int, FontWeight> get defaultFontWeight => _defaultFontWeight;
}
