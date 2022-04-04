import './shadow.dart';
import 'package:flutter/material.dart';

class CaCard extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final double? borderRadiusAll, paddingAll, marginAll;
  final EdgeInsetsGeometry? padding, margin;
  final Color? color;
  final GestureTapCallback? onTap;
  final bool bordered;
  final Border? border;
  final Clip? clipBehavior;
  final BoxShape? boxShape;
  final CaShadow? shadow;
  final double? width, height;
  final Color? splashColor;

  const CaCard(
      {Key? key,
      required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.color,
      this.paddingAll,
      this.onTap,
      this.border,
      this.bordered = false,
      this.clipBehavior,
      this.boxShape,
      this.shadow,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.width,
      this.height})
      : super(key: key);

  const CaCard.bordered(
      {Key? key,
      required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.color,
      this.paddingAll,
      this.onTap,
      this.border,
      this.bordered = true,
      this.clipBehavior,
      this.boxShape,
      this.shadow,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.width,
      this.height})
      : super(key: key);

  const CaCard.rounded(
      {Key? key,
      required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.color,
      this.paddingAll,
      this.onTap,
      this.border,
      this.bordered = false,
      this.clipBehavior = Clip.antiAliasWithSaveLayer,
      this.boxShape = BoxShape.circle,
      this.shadow,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    CaShadow myShadow = shadow ?? CaShadow();
    return InkWell(
      borderRadius: boxShape != BoxShape.circle
          ? borderRadius ??
              BorderRadius.all(Radius.circular(borderRadiusAll ?? 8))
          : null,
      splashColor: splashColor ?? Colors.transparent,
      highlightColor: splashColor ?? Colors.transparent,
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin ?? EdgeInsets.all(marginAll ?? 0),
        decoration: BoxDecoration(
            color: color ?? theme.colorScheme.background,
            borderRadius: boxShape != BoxShape.circle
                ? borderRadius ??
                    BorderRadius.all(Radius.circular(borderRadiusAll ?? 8))
                : null,
            border: bordered
                ? border ??
                    Border.all(color: theme.colorScheme.background, width: 1)
                : null,
            shape: boxShape ?? BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                  color: myShadow.color ??
                      theme.shadowColor.withAlpha(myShadow.alpha),
                  spreadRadius: myShadow.spreadRadius,
                  blurRadius: myShadow.blurRadius,
                  offset: myShadow.offset!)
            ]),
        padding: padding ?? EdgeInsets.all(paddingAll ?? 16),
        clipBehavior: clipBehavior ?? Clip.none,
        child: child,
      ),
    );
  }
}
