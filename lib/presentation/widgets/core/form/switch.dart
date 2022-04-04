import 'package:flutter/material.dart';

class KkSwitch extends StatelessWidget {
  const KkSwitch({
    required this.title,
    this.activeColor,
    this.value,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final Color? activeColor;
  final bool? value;
  final String title;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var color = activeColor ?? theme.primaryColor;
    return Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: theme.disabledColor),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: SwitchListTile(
          activeColor: color,
          value: value ?? false,
          onChanged: onChanged,
          title: Text(title),
        ));
  }
}
