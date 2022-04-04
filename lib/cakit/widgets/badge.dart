import 'text.dart';
import 'text_style.dart';
import 'package:flutter/material.dart';

class CaBadge extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;

  const CaBadge({Key? key, required this.text, this.color, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(2),
      constraints: BoxConstraints(maxHeight: 22, minWidth: 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: color ?? theme.primaryColor,
      ),
      child: Center(
          child: CaText.caption(text,
              xMuted: false,
              muted: false,
              color: textColor ?? theme.colorScheme.onPrimary)),
    );
  }
}
