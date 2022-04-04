import 'package:flutter/material.dart';

class Units {
  static const double base = 4;
}

class KkSpacing {
  static vertical(int units) {
    return SizedBox(
      height: units * Units.base,
    );
  }

  static horizontal(int units) {
    return SizedBox(width: units * Units.base);
  }

  static get mainSpace => KkSpacing.vertical(4);
  static get mainSpaceHorizontal => KkSpacing.horizontal(4);
  static get subSpace => KkSpacing.vertical(1);
  static get subSpaceHorizontal => KkSpacing.horizontal(1);
}

class KkPadding {
  static get all => const EdgeInsets.all(Units.base);
  static get top => const EdgeInsets.only(top: Units.base);
}
