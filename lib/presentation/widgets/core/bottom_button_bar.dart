import 'package:flutter/material.dart';
import 'package:kalyana_gadiya/cakit/widgets/container.dart';

import 'button.dart';

class BottomButtonBar extends StatelessWidget {
  final Color? backgroundColor;
  final KkButton? leftButton;
  final KkButton? rightButton;
  final double? progressValue;

  const BottomButtonBar(
      {Key? key,
      this.leftButton,
      this.rightButton,
      this.progressValue,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (progressValue != null)
          _getLinearProgressIndicator(theme, progressValue!),
        CaContainer(
          paddingAll: 0,
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: leftButton ?? Container()),
              Expanded(child: rightButton ?? Container())
            ],
          ),
        ),
      ],
    );
  }

  Widget _getLinearProgressIndicator(ThemeData theme, double value) {
    return LinearProgressIndicator(
        minHeight: 3,
        color: backgroundColor ?? theme.primaryColor.withAlpha(160),
        value: value);
  }
}
