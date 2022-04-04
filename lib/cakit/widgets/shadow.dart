import 'package:flutter/material.dart';

enum CaShadowPosition {
  topLeft,
  top,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottom,
  bottomRight
}

class CaShadow{
  late int alpha;
  late double elevation, spreadRadius, blurRadius;
  Offset? offset;
  CaShadowPosition? position;
  Color? color;
  bool? darkShadow;

  CaShadow(
      {double elevation = 8,
        double? spreadRadius,
        double? blurRadius,
        Offset? offset,
        CaShadowPosition position = CaShadowPosition.bottom,
        int? alpha,
        Color? color,bool darkShadow=false}) {
    this.spreadRadius = spreadRadius ?? elevation * 0.125;
    this.blurRadius = blurRadius ?? elevation * 2;
    this.alpha = alpha!=null? alpha : (darkShadow ? 100 : 36);
    this.elevation = elevation;
    this.offset = offset;
    this.position = position;
    this.color = color;
    this.darkShadow = darkShadow;

    if (offset == null) {
      switch (position) {
        case CaShadowPosition.topLeft:
          this.offset = Offset(-elevation, -elevation);
          break;
        case CaShadowPosition.top:
          this.offset = Offset(0, -elevation);
          break;
        case CaShadowPosition.topRight:
          this.offset = Offset(elevation, -elevation);
          break;
        case CaShadowPosition.centerLeft:
          this.offset = Offset(-elevation, elevation*0.25);
          break;
        case CaShadowPosition.center:
          this.offset = Offset(0, 0);
          break;
        case CaShadowPosition.centerRight:
          this.offset = Offset(elevation, elevation*0.25);
          break;
        case CaShadowPosition.bottomLeft:
          this.offset = Offset(-elevation, elevation);
          break;
        case CaShadowPosition.bottom:
          this.offset = Offset(0, elevation);
          break;
        case CaShadowPosition.bottomRight:
          this.offset = Offset(elevation, elevation);
          break;
      }
    }
  }

  @override
  String toString() {
    return 'CaShadow{alpha: $alpha, elevation: $elevation, spreadRadius: $spreadRadius, blurRadius: $blurRadius, offset: $offset, position: $position, color: $color, darkShadow: $darkShadow}';
  }


}