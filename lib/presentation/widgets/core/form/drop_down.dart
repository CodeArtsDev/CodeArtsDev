import 'package:feather_icons/feather_icons.dart';

import '../spacing.dart';
import '../text.dart';
import 'package:flutter/material.dart';

typedef OnDropDownSelect<T> = void Function(T);
typedef OptionLabelProvider<T> = String Function(T);

class KkDropDown<T> extends StatelessWidget {
  final GlobalKey _dropDownKey = GlobalKey();
  final OnDropDownSelect onSelected;
  final String selectedText;
  final List options;
  final OptionLabelProvider<T> labelProvider;

  KkDropDown(
      {Key? key,
      required this.options,
      required this.labelProvider,
      required this.selectedText,
      required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return PopupMenuButton(
        key: _dropDownKey,
        onSelected: onSelected,
        itemBuilder: (BuildContext context) {
          return options.map((option) {
            return PopupMenuItem(
                padding: const EdgeInsets.only(left: 16),
                value: option,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    const Icon(
                      FeatherIcons.check,
                      color: Colors.black,
                    ),
                    Expanded(
                        child: KkText.subHeaderLight(labelProvider(option))),
                  ]),
                ));
          }).toList();
        },
        color: Colors.white,
        child: Container(
          padding: KkPadding.all,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: theme.disabledColor, width: 1),
          ),
          child: Row(
            children: <Widget>[
              Expanded(child: KkText.subHeaderLight(selectedText)),
              const Icon(
                FeatherIcons.chevronDown,
                size: 22,
              )
            ],
          ),
        ));
  }
}
