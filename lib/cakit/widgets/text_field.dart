import 'package:feather_icons/feather_icons.dart';

import './text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

enum CaTextFieldType {
  none,
  email,
  password,
  name,
  address,
  mobileNumber,
  about,
  payment,
  search
}
enum CaTextFieldStyle { underlined, outlined, none }

class CaTextField extends StatefulWidget {
  final CaTextFieldType textFieldType;
  final CaTextFieldStyle textFieldStyle;
  final bool? autoIcon;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final double? enabledBorderRadius;
  final double? focusedBorderRadius;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? labelTextColor;
  final bool? autoFocusedBorder;
  final bool enableHint;
  final Color? textColor;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool? autofocus;
  final String? obscuringCharacter;
  final bool? obscureText;
  final bool? autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool? enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final bool? readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final Brightness? keyboardAppearance;
  final int? noMaxLength = -1;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final ui.BoxHeightStyle? selectionHeightStyle;
  final ui.BoxWidthStyle? selectionWidthStyle;
  final EdgeInsets? scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final DragStartBehavior? dragStartBehavior;

  bool? get selectionEnabled => enableInteractiveSelection;
  final GestureTapCallback? onTap;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final String? restorationId;

  // input decoration properties
  final Widget? icon;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? helperText;
  final TextStyle? helperStyle;
  final int? helperMaxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextDirection? hintTextDirection;
  final int? hintMaxLines;
  final String? errorText;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isCollapsed;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? prefix;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final BoxConstraints? suffixIconConstraints;
  final String? counterText;
  final Widget? counter;
  final TextStyle? counterStyle;
  final bool? filled;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final bool? textEnabled;
  final String? semanticCounterText;
  final bool? alignLabelWithHint;

  const CaTextField(
      {this.controller,
      this.focusNode,
      this.decoration,
      this.keyboardType,
      this.textInputAction,
      this.textCapitalization,
      this.style,
      this.strutStyle,
      this.textAlign,
      this.textAlignVertical,
      this.textDirection,
      this.autofocus,
      this.obscuringCharacter,
      this.obscureText,
      this.autocorrect,
      this.smartDashesType,
      this.smartQuotesType,
      this.enableSuggestions,
      this.keyboardAppearance,
      this.maxLines,
      this.minLines,
      this.expands,
      this.readOnly,
      this.toolbarOptions,
      this.showCursor,
      this.maxLength,
      this.maxLengthEnforcement,
      this.onChanged,
      this.onEditingComplete,
      this.onSubmitted,
      this.onAppPrivateCommand,
      this.inputFormatters,
      this.enabled,
      this.cursorWidth,
      this.cursorHeight,
      this.cursorRadius,
      this.cursorColor,
      this.selectionHeightStyle,
      this.selectionWidthStyle,
      this.scrollPadding,
      this.enableInteractiveSelection,
      this.selectionControls,
      this.dragStartBehavior,
      this.onTap,
      this.mouseCursor,
      this.buildCounter,
      this.scrollPhysics,
      this.scrollController,
      this.autofillHints,
      this.restorationId,
//input decoration properties
      this.icon,
      this.labelText,
      this.labelStyle,
      this.helperText,
      this.helperStyle,
      this.helperMaxLines,
      this.hintText,
      this.hintStyle,
      this.hintTextDirection,
      this.hintMaxLines,
      this.errorText,
      this.errorStyle,
      this.errorMaxLines,
      this.floatingLabelBehavior,
      this.isCollapsed,
      this.isDense,
      this.contentPadding,
      this.prefixIcon,
      this.prefixIconConstraints,
      this.prefix,
      this.prefixText,
      this.prefixStyle,
      this.suffixIcon,
      this.suffix,
      this.suffixText,
      this.suffixStyle,
      this.suffixIconConstraints,
      this.counter,
      this.counterText,
      this.counterStyle,
      this.filled,
      this.fillColor,
      this.focusColor,
      this.hoverColor,
      this.errorBorder,
      this.focusedBorder,
      this.focusedErrorBorder,
      this.disabledBorder,
      this.enabledBorder,
      this.border,
      this.textEnabled,
      this.semanticCounterText,
      this.alignLabelWithHint,
      this.textFieldType = CaTextFieldType.name,
      this.textFieldStyle = CaTextFieldStyle.outlined,
      this.autoIcon,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.enabledBorderRadius,
      this.focusedBorderRadius,
      this.labelTextColor,
      this.prefixIconColor,
      this.suffixIconColor,
      this.autoFocusedBorder,
      this.enableHint = true,
      this.textColor,
      Key? key})
      : super(key: key);

  @override
  _CaTextFieldState createState() => _CaTextFieldState();
}

class _CaTextFieldState extends State<CaTextField> {
  late ThemeData _theme;
  late String? labelText;
  late TextInputType? keyboardType;
  late Color? fillColor;
  late InputBorder? enabledBorder;
  late InputBorder? focusedBorder;
  late bool? filled;
  late Widget? prefixIcon;
  late bool? obscureText;
  late int? minLines;
  late int? maxLines;
  late Widget? suffixIcon;
  late bool showPassword;
  late bool autoIcon;
  late Color? enabledBorderColor;
  late Color? focusedBorderColor;
  late double? enabledBorderRadius;
  late double? focusedBorderRadius;
  late Color? prefixIconColor;
  late Color? suffixIconColor;
  late Color? labelTextColor, textColor;
  late Color? cursorColor;
  late bool autoFocusedBorder;
  late InputBorder? border;
  late TextInputAction? textInputAction;

  @override
  void initState() {
    super.initState();
    showPassword = false;
    obscureText =
        widget.obscureText ?? widget.textFieldType == CaTextFieldType.password
            ? true
            : false;
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    labelText = widget.labelText;
    keyboardType = widget.keyboardType;
    fillColor = widget.fillColor;
    enabledBorder = widget.enabledBorder;
    focusedBorder = widget.focusedBorder;
    filled = widget.filled;
    fillColor = fillColor ?? _theme.inputDecorationTheme.fillColor!;
    prefixIcon = widget.prefixIcon;

    minLines = widget.minLines;
    maxLines = widget.maxLines;

    suffixIcon = widget.suffixIcon;
    enabledBorderColor = widget.enabledBorderColor;
    focusedBorderColor = widget.focusedBorderColor;
    enabledBorderRadius = widget.enabledBorderRadius;
    focusedBorderRadius = widget.focusedBorderRadius;
    suffixIconColor = widget.suffixIconColor;
    prefixIconColor = widget.prefixIconColor;
    labelTextColor = widget.labelTextColor;
    cursorColor = widget.cursorColor;
    autoFocusedBorder = widget.autoFocusedBorder ?? true;
    border = widget.border;
    autoIcon = widget.autoIcon ?? true;
    textColor = widget.textColor ?? labelTextColor;
    textInputAction = widget.textInputAction;

    buildPasswordField();

    buildTextFieldStyle();

    buildTextFieldType();

    return TextField(
      style: widget.style ?? CaTextStyle.b1(color: textColor),
      onTap: widget.onTap,
      cursorColor: cursorColor,
      textAlign: widget.textAlign ?? TextAlign.start,
      decoration: widget.decoration ??
          InputDecoration(
            icon: widget.icon,
            border: border,
            focusedBorder: focusedBorder,
            prefixIcon: prefixIcon,
            alignLabelWithHint: true,
            contentPadding: widget.contentPadding ?? const EdgeInsets.all(16),
            counter: widget.counter,
            counterStyle: widget.counterStyle,
            counterText: widget.counterText,
            disabledBorder: widget.disabledBorder,
            enabled: widget.textEnabled ?? true,
            enabledBorder: enabledBorder,
            errorBorder: widget.enabledBorder,
            errorMaxLines: widget.errorMaxLines,
            errorStyle: widget.errorStyle,
            errorText: widget.errorText,
            fillColor: fillColor,
            filled: filled,
            floatingLabelBehavior: widget.floatingLabelBehavior,
            focusColor: widget.focusColor,
            focusedErrorBorder: widget.focusedErrorBorder,
            suffixText: widget.suffixText,
            suffixStyle: widget.suffixStyle,
            suffixIconConstraints: widget.suffixIconConstraints,
            suffixIcon: suffixIcon,
            suffix: widget.suffix,
            semanticCounterText: widget.semanticCounterText,
            prefixText: widget.prefixText,
            prefixStyle: widget.prefixStyle,
            prefixIconConstraints: widget.prefixIconConstraints,
            prefix: widget.prefix,
            labelText: labelText,
            labelStyle:
                widget.labelStyle ?? CaTextStyle.b1(color: labelTextColor),
            helperMaxLines: widget.helperMaxLines,
            isDense: widget.isDense ?? false,
            helperStyle: widget.helperStyle,
            helperText: widget.helperText,
            isCollapsed: widget.isCollapsed ?? false,
            hoverColor: widget.hoverColor,
            hintMaxLines: widget.hintMaxLines,
            hintStyle: widget.hintStyle ??
                widget.labelStyle ??
                CaTextStyle.b1(color: labelTextColor),
            hintText: widget.enableHint ? (widget.hintText ?? labelText) : null,
            hintTextDirection: widget.hintTextDirection,
          ),
      autocorrect: widget.autocorrect ?? true,
      autofillHints: widget.autofillHints,
      autofocus: widget.autofocus ?? false,
      buildCounter: widget.buildCounter,
      controller: widget.controller,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorWidth: widget.cursorWidth ?? 2.0,
      dragStartBehavior: widget.dragStartBehavior ?? DragStartBehavior.start,
      enabled: widget.enabled,
      enableInteractiveSelection: widget.enableInteractiveSelection ?? true,
      enableSuggestions: widget.enableSuggestions ?? true,
      expands: widget.expands ?? false,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      key: widget.key,
      keyboardType: keyboardType,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      maxLines: maxLines,
      minLines: minLines,
      mouseCursor: widget.mouseCursor,
      obscureText: obscureText ?? false,
      obscuringCharacter: widget.obscuringCharacter ?? '•',
      onAppPrivateCommand: widget.onAppPrivateCommand,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      readOnly: widget.readOnly ?? false,
      restorationId: widget.restorationId,
      scrollController: widget.scrollController,
      scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20.0),
      scrollPhysics: widget.scrollPhysics,
      selectionControls: widget.selectionControls,
      selectionHeightStyle:
          widget.selectionHeightStyle ?? ui.BoxHeightStyle.tight,
      selectionWidthStyle: widget.selectionWidthStyle ?? ui.BoxWidthStyle.tight,
      showCursor: widget.showCursor,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      strutStyle: widget.strutStyle,
      textAlignVertical: widget.textAlignVertical,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      toolbarOptions: widget.toolbarOptions,
      textInputAction: textInputAction,
      textDirection: widget.textDirection,
      keyboardAppearance: widget.keyboardAppearance,
    );
  }

  void buildTextFieldStyle() {
    switch (widget.textFieldStyle) {
      case CaTextFieldStyle.underlined:
        filled = filled ?? true;
        fillColor = fillColor ?? _theme.inputDecorationTheme.fillColor;
        enabledBorder = enabledBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: enabledBorderColor ??
                    _theme.inputDecorationTheme.enabledBorder!.borderSide.color,
              ),
            );

        focusedBorder = focusedBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor ?? _theme.colorScheme.primary,
              ),
            );
        break;

      case CaTextFieldStyle.outlined:
        filled = filled ?? false;
        fillColor = fillColor ?? _theme.inputDecorationTheme.fillColor;
        enabledBorder = enabledBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(enabledBorderRadius ?? 8)),
              borderSide: BorderSide(
                color: autoFocusedBorder
                    ? Colors.transparent
                    : enabledBorderColor ??
                        _theme.inputDecorationTheme.enabledBorder!.borderSide
                            .color,
              ),
            );

        focusedBorder = focusedBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(enabledBorderRadius ?? 8)),
              borderSide: BorderSide(
                color: focusedBorderColor ?? _theme.colorScheme.primary,
              ),
            );
        border = enabledBorder;
        enabledBorder = null;

        break;

      case CaTextFieldStyle.none:
        focusedBorder = InputBorder.none;
        border = focusedBorder;

        break;
    }
  }

  void buildTextFieldType() {
    switch (widget.textFieldType) {
      case CaTextFieldType.email:
        prefixIcon = prefixIcon ??
            (autoIcon
                ? Icon(
                    Icons.email,
                    color: prefixIconColor,
                  )
                : null);
        labelText = widget.labelText ?? "Email Address";
        keyboardType = keyboardType ?? TextInputType.emailAddress;
        break;
      case CaTextFieldType.password:
        maxLines = 1;
        prefixIcon = prefixIcon ??
            (autoIcon
                ? Icon(
                    Icons.lock_outline,
                    color: prefixIconColor,
                  )
                : null);
        labelText = widget.labelText ?? "Password";
        keyboardType = keyboardType ?? TextInputType.text;
        obscureText = obscureText ?? true;
        break;
      case CaTextFieldType.name:
        prefixIcon = prefixIcon ??
            (autoIcon
                ? Icon(
                    FeatherIcons.user,
                    color: prefixIconColor,
                  )
                : null);
        labelText = widget.labelText ?? "Name";
        keyboardType = keyboardType ?? TextInputType.text;
        break;
      case CaTextFieldType.about:
        prefixIcon = prefixIcon ??
            (autoIcon
                ? Icon(
                    FeatherIcons.user,
                    color: prefixIconColor,
                  )
                : null);
        labelText = widget.labelText ?? "About";
        minLines = 3;
        maxLines = 3;
        keyboardType = keyboardType ?? TextInputType.text;
        break;
      case CaTextFieldType.address:
        prefixIcon = prefixIcon ??
            (autoIcon
                ? Icon(
                    Icons.location_on_outlined,
                    color: prefixIconColor,
                  )
                : null);
        labelText = widget.labelText ?? "Address";
        keyboardType = keyboardType ?? TextInputType.streetAddress;
        break;
      case CaTextFieldType.mobileNumber:
        prefixIcon = prefixIcon ??
            (autoIcon
                ? Icon(
                    Icons.phone_outlined,
                    color: prefixIconColor,
                  )
                : null);
        labelText = widget.labelText ?? "Mobile Number";
        keyboardType = keyboardType ?? TextInputType.phone;
        break;
      case CaTextFieldType.payment:
        prefixIcon = prefixIcon ??
            (autoIcon
                ? Icon(
                    Icons.payment,
                    color: prefixIconColor,
                  )
                : null);
        labelText = widget.labelText ?? "Payment";
        keyboardType = keyboardType ?? TextInputType.text;
        break;
      case CaTextFieldType.search:
        prefixIcon = prefixIcon ??
            (autoIcon
                ? Icon(
                    Icons.search,
                    color: prefixIconColor,
                  )
                : null);
        labelText = widget.labelText ?? "Search";
        keyboardType = keyboardType ?? TextInputType.text;
        textInputAction = TextInputAction.search;
        break;
      default:
        labelText = "Label";
        break;
    }
  }

  void buildPasswordField() {
    if (widget.textFieldType == CaTextFieldType.password) {
      suffixIcon = autoIcon
          ? InkWell(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                  obscureText = !obscureText!;
                });
              },
              child: (showPassword
                  ? Icon(Icons.visibility_outlined,
                      color: widget.suffixIconColor)
                  : Icon(Icons.visibility_off_outlined,
                      color: widget.suffixIconColor)))
          : widget.suffixIcon;
    }
  }
}
