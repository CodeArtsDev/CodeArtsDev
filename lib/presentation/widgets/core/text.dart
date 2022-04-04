import 'package:flutter/material.dart';
import 'package:kalyana_gadiya/cakit/widgets/text.dart';

class MultiText {
  CaText text;

  MultiText(this.text);
}

class KkText {
  static mainHeader(String text,
      {Color? color, TextAlign textAlign = TextAlign.left}) {
    return CaText.h5(
      text,
      color: color,
      fontWeight: 800,
      textAlign: textAlign,
      maxLines: 1,
    );
  }

  static subHeader(String text, {Color? color}) {
    return CaText.h6(text, color: color, fontWeight: 600);
  }

  static subHeader2(String text,
      {Color? color, TextAlign textAlign = TextAlign.left}) {
    return CaText.sh1(
      text,
      color: color,
      fontWeight: 600,
      textAlign: textAlign,
    );
  }

  static subHeaderLight(String text,
      {Color? color, TextAlign textAlign = TextAlign.left}) {
    return CaText.sh1(
      text,
      color: color,
      fontWeight: 500,
      textAlign: textAlign,
    );
  }

  static appBarTitle(String text, {Color? color, TextAlign? textAlign}) {
    return CaText.h6(
      text,
      color: color,
      letterSpacing: 1.2,
      textAlign: textAlign,
    );
  }

  static appBarDescription(String text, {Color? color, TextAlign? textAlign}) {
    return CaText.b2(
      text,
      color: color,
      maxLines: 3,
      muted: true,
      textAlign: textAlign,
    );
  }

  static paragraph(String text,
      {Color? color, TextAlign? textAlign, double? letterSpacing}) {
    return CaText.b2(
      text,
      color: color,
      textAlign: textAlign,
      letterSpacing: letterSpacing,
    );
  }

  static caption(String text,
      {Color? color, bool muted = true, bool xMuted = true}) {
    return CaText.caption(
      text,
      color: color,
      muted: muted,
      xMuted: xMuted,
      maxLines: 1,
    );
  }

  static tabBarHeading(String text, {Color? color, bool isSelected = false}) {
    return CaText.b1(text,
        color: color,
        muted: false,
        xMuted: false,
        fontWeight: isSelected ? 600 : 500);
  }

  static radioText(String text, {Color? color, int fontWeight = 500}) {
    return CaText.sh1(text, color: color, fontWeight: fontWeight);
  }

  static multiText(List<CaText> texts) {
    return Text.rich(TextSpan(
      children: _getTextSpan(texts),
    ));
  }

  static _getTextSpan(List<CaText> texts) {
    return texts
        .map((text) => TextSpan(text: text.text, style: text.getTextStyle()))
        .toList();
  }
}
