import 'package:flutter/material.dart';
import 'package:kalyana_gadiya/cakit/widgets/text_field.dart';
import 'package:kalyana_gadiya/cakit/widgets/text_style.dart';

class KkTextField extends StatelessWidget {
  final CaTextFieldType? textFieldType;
  final String? errorMessage;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmited;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool enabled;
  final int minLines;
  final int maxLines;
  final Widget? prefix;
  final Widget? suffix;
  final String? labelText;
  final bool filled;

  const KkTextField(
      {this.textFieldType,
      this.errorMessage,
      this.onChanged,
      this.onSubmited,
      this.textInputAction,
      this.controller,
      this.focusNode,
      this.enabled = true,
      this.minLines = 1,
      this.maxLines = 1,
      this.prefix,
      this.labelText,
      this.filled = true,
      this.suffix,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var hasError = errorMessage != null;

    var color = hasError ? theme.errorColor : theme.primaryColor;

    if (_isSearchBox()) color = theme.iconTheme.color!;

    return CaTextField(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      textFieldType: textFieldType ?? CaTextFieldType.none,
      textFieldStyle:
          _isSearchBox() ? CaTextFieldStyle.none : CaTextFieldStyle.outlined,
      filled: false,
      // autoIcon: false,
      fillColor: color.withAlpha(40),
      labelText: labelText,
      focusedBorderColor: color,
      prefixIconColor: color,
      labelTextColor: color,
      cursorColor: color,
      errorText: errorMessage,
      onChanged: onChanged,
      textInputAction: textInputAction,
      onSubmitted: onSubmited,
      controller: controller,
      focusNode: focusNode,
      enabled: enabled,
      minLines: minLines,
      maxLines: maxLines,
      prefixIcon: prefix,
      suffixIcon: suffix,
      labelStyle: _isSearchBox()
          ? CaTextStyle.caption(color: color, muted: true, xMuted: true)
          : null,
    );
  }

  bool _isSearchBox() {
    return CaTextFieldType.search == textFieldType;
  }
}
