import 'package:flutter/material.dart';
import 'package:kalyana_gadiya/cakit/widgets/button.dart';
import 'package:kalyana_gadiya/cakit/widgets/text.dart';
import 'package:kalyana_gadiya/presentation/widgets/core/spacing.dart';

class KkButton extends StatelessWidget {
  final CaButtonType? buttonType;
  final VoidCallback? onPressed;
  final bool? disabled;
  final Color? backgroundColor;
  final Color borderColor;
  final bool isLoading;
  final String text;
  final bool? isUnderLine;
  final Color? textColor;
  final bool? hasRadius;
  final bool? isSmall;
  final String? subText;
  final IconData? icon;

  const KkButton(this.text,
      {Key? key,
      this.buttonType,
      this.onPressed,
      this.disabled,
      this.backgroundColor,
      this.borderColor = Colors.transparent,
      this.isLoading = false,
      this.isUnderLine,
      this.textColor,
      this.hasRadius = true,
      this.subText,
      this.isSmall = false,
      this.icon})
      : super(key: key);

  static KkButton cloneButton(KkButton button, VoidCallback? onpressed) {
    var clonnedButton = KkButton(
      button.text,
      backgroundColor: button.backgroundColor,
      buttonType: button.buttonType,
      disabled: button.disabled,
      borderColor: button.borderColor,
      isLoading: button.isLoading,
      isUnderLine: button.isUnderLine,
      textColor: button.textColor,
      hasRadius: button.hasRadius,
      isSmall: button.isSmall,
      onPressed: onpressed,
      icon: button.icon,
    );

    return clonnedButton;
  }

  const KkButton.rounded(
    this.text, {
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    this.buttonType = CaButtonType.elevated,
    this.disabled = false,
    this.borderColor = Colors.transparent,
    this.isLoading = false,
    this.isUnderLine,
    this.textColor,
    this.hasRadius = true,
    this.subText,
    this.isSmall = false,
    this.icon,
  }) : super(key: key);

  const KkButton.small(
    this.text, {
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    this.buttonType = CaButtonType.elevated,
    this.disabled = false,
    this.borderColor = Colors.transparent,
    this.isLoading = false,
    this.isUnderLine,
    this.textColor,
    this.hasRadius = true,
    this.subText,
    this.isSmall = false,
    this.icon,
  }) : super(key: key);

  const KkButton.medium(
    this.text, {
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    this.buttonType = CaButtonType.elevated,
    this.disabled = false,
    this.borderColor = Colors.transparent,
    this.isLoading = false,
    this.isUnderLine,
    this.textColor,
    this.hasRadius = true,
    this.subText,
    this.isSmall = false,
    this.icon,
  }) : super(key: key);

  const KkButton.text(this.text,
      {Key? key,
      required this.onPressed,
      this.backgroundColor,
      this.buttonType = CaButtonType.text,
      this.disabled = false,
      this.borderColor = Colors.transparent,
      this.isLoading = false,
      this.isUnderLine,
      this.textColor,
      this.hasRadius = true,
      this.subText,
      this.isSmall = false,
      this.icon})
      : super(key: key);

  const KkButton.textSmall(this.text,
      {Key? key,
      required this.onPressed,
      this.backgroundColor,
      this.buttonType = CaButtonType.text,
      this.disabled = false,
      this.borderColor = Colors.transparent,
      this.isLoading = false,
      this.isUnderLine,
      this.textColor,
      this.hasRadius = true,
      this.subText,
      this.isSmall = true,
      this.icon})
      : super(key: key);

  const KkButton.textUnderLine(this.text,
      {Key? key,
      required this.onPressed,
      this.backgroundColor,
      this.buttonType = CaButtonType.text,
      this.disabled = false,
      this.borderColor = Colors.transparent,
      this.isLoading = false,
      this.isUnderLine = true,
      this.textColor,
      this.hasRadius = true,
      this.subText,
      this.isSmall = false,
      this.icon})
      : super(key: key);

  const KkButton.block(this.text,
      {Key? key,
      required this.onPressed,
      this.backgroundColor,
      this.buttonType = CaButtonType.elevated,
      this.disabled = false,
      this.borderColor = Colors.transparent,
      this.isLoading = false,
      this.isUnderLine,
      this.textColor,
      this.hasRadius = true,
      this.subText,
      this.isSmall = false,
      this.icon})
      : super(key: key);

  const KkButton.outlined(this.text,
      {Key? key,
      required this.onPressed,
      this.backgroundColor,
      this.buttonType = CaButtonType.outlined,
      this.disabled = false,
      this.borderColor = Colors.transparent,
      this.isLoading = false,
      this.isUnderLine,
      this.textColor,
      this.hasRadius = true,
      this.isSmall = false,
      this.subText,
      this.icon})
      : super(key: key);

  const KkButton.large(this.text,
      {Key? key,
      required this.onPressed,
      this.backgroundColor,
      this.buttonType = CaButtonType.elevated,
      this.disabled = false,
      this.borderColor = Colors.transparent,
      this.isLoading = false,
      this.isUnderLine,
      this.textColor,
      this.hasRadius = true,
      this.isSmall = false,
      this.subText,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var buttonBackgroundColor = backgroundColor ?? theme.primaryColor;

    return CaButton(
      onPressed: onPressed ?? () {},
      child: isLoading
          ? _getCircularProgressIndicator(theme)
          : _getButtonText(theme),
      backgroundColor: buttonBackgroundColor,
      buttonType: buttonType,
      disabled: disabled == true || isLoading,
      borderRadiusAll: hasRadius == true ? 40 : 0,
      borderColor: borderColor,
    );
  }

  Widget _getCircularProgressIndicator(ThemeData theme) {
    var textColor = this.textColor ??
        (buttonType == CaButtonType.elevated
            ? theme.colorScheme.onPrimary
            : theme.primaryColor);

    var loading = SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: textColor,
        ));

    if (isSmall == true) return loading;

    return Padding(
      padding: KkPadding.all,
      child: loading,
    );
  }

  Widget _getButtonText(ThemeData theme) {
    CaText buttonText;
    var textColor = this.textColor ??
        (buttonType == CaButtonType.elevated
            ? theme.colorScheme.onPrimary
            : theme.primaryColor);
    var decoration =
        isUnderLine == true ? TextDecoration.underline : TextDecoration.none;
    if (isSmall == true) {
      buttonText = CaText.caption(text,
          muted: false,
          xMuted: false,
          color: textColor,
          decoration: decoration);
    } else {
      buttonText = CaText.b1(text,
          color: textColor,
          fontWeight: 600,
          letterSpacing: 0.3,
          decoration: decoration);
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: icon == null
          ? buttonText
          : Row(children: [
              Icon(
                icon,
                color: textColor,
              ),
              const SizedBox(
                width: 16,
              ),
              buttonText
            ]),
    );
  }
}
