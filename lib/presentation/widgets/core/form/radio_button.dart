import 'package:flutter/material.dart';

import '../text.dart';

class KkRadioButton<T> extends StatelessWidget {
  const KkRadioButton({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final T value;
  final T groupValue;
  final Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var fontWeight = value == groupValue ? 600 : 500;
    return Theme(
      data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.black,
          disabledColor: theme.primaryColor),
      child: Container(
        height: 40,
        child: RadioListTile<T>(
          contentPadding: EdgeInsets.all(0),
          activeColor: Colors.black,
          title: KkText.radioText(title,
              color: Colors.black, fontWeight: fontWeight),
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
