import 'dart:ui';
import 'package:flutter/material.dart';

class CaContainer extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final double? borderRadiusAll, paddingAll,marginAll;
  final EdgeInsetsGeometry? padding,margin;
  final Color? color;
  final bool bordered;
  final Border? border;
  final Clip? clipBehavior;
  final BoxShape shape;
  final double? width, height;
  final AlignmentGeometry? alignment;
  final GestureTapCallback? onTap;
  final Color? splashColor;

  const CaContainer(
      {Key? key,
      required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll,
      this.border,
      this.bordered = false,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.onTap, this.marginAll, this.margin, this.splashColor})
      : super(key: key);

  const CaContainer.none(
      {Key? key,
      required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll = 0,
      this.paddingAll = 0,
      this.border,
      this.bordered = false,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.onTap, this.marginAll, this.margin, this.splashColor})
      : super(key: key);

  const CaContainer.bordered(
      {Key? key,
      required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll,
      this.border,
      this.bordered = true,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.onTap, this.marginAll, this.margin, this.splashColor})
      : super(key: key);

  const CaContainer.roundBordered(
      {Key? key,
      required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll,
      this.border,
      this.bordered = true,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.circle,
      this.width,
      this.height,
      this.alignment,
      this.onTap, this.marginAll, this.margin, this.splashColor})
      : super(key: key);

  const CaContainer.rounded(
      {Key? key,
      required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll,
      this.border,
      this.bordered = false,
      this.clipBehavior = Clip.antiAliasWithSaveLayer,
      this.color,
      this.shape = BoxShape.circle,
      this.width,
      this.height,
      this.alignment,
      this.onTap, this.marginAll, this.margin, this.splashColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      borderRadius:  shape != BoxShape.circle
          ? borderRadius ?? BorderRadius.all(Radius.circular(borderRadiusAll ?? 8))
          : null,
      onTap: onTap,
      splashColor: splashColor ?? Colors.transparent,
      highlightColor: splashColor?? Colors.transparent,
      child: Container(
        width: width,
        height: height,
        alignment: alignment,
        margin: margin??EdgeInsets.all(marginAll??0),
        decoration: BoxDecoration(
            color: color ?? theme.colorScheme.background,
            shape: shape,
            borderRadius: shape == BoxShape.rectangle
                ? borderRadius ?? BorderRadius.all(Radius.circular(borderRadiusAll ?? 8))
                : null,
            border: bordered
                ? border ?? Border.all(color: theme.colorScheme.background, width: 1)
                : null),
        padding: padding ?? EdgeInsets.all(paddingAll ?? 16),
        clipBehavior: clipBehavior ?? Clip.none,
        child: child,
      ),
    );
  }
}
