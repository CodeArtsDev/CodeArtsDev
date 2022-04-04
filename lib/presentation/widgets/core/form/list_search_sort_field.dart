import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:kalyana_gadiya/cakit/widgets/card.dart';
import 'package:kalyana_gadiya/cakit/widgets/shadow.dart';
import 'package:kalyana_gadiya/cakit/widgets/text_field.dart';

import 'text_field.dart';

class ListSearchFilterField extends StatelessWidget {
  final VoidCallback? onfilterTap;
  final bool? isFiltered;

  ListSearchFilterField({Key? key, this.onfilterTap, this.isFiltered = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CaCard(
      shadow: CaShadow(elevation: 0),
      bordered: true,
      height: 40,
      paddingAll: 0,
      borderRadiusAll: 0,
      color: Colors.white,
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: KkTextField(
                filled: false,
                textFieldType: CaTextFieldType.search,
                labelText: "Search by name",
                // prefix: Icon(FeatherIcons.arrowLeft),
                // suffix: Icon(Icons.close),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: VerticalDivider(
                thickness: 1.2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: InkWell(
                onTap: onfilterTap,
                child: _getfilterIcon(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getfilterIcon() {
    var icon = Icon(
      FeatherIcons.sliders,
      size: 16,
    );

    if (isFiltered == true) {
      return Stack(
        children: [
          icon,
          // Positioned(
          //     right: -2,
          //     top: -2,
          //     child: DotIndicator(
          //       color: Colors.red,
          //       size: 10,
          //     ))
        ],
      );
    }

    return icon;
  }
}
