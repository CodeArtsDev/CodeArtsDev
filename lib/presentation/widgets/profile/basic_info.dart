import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:kalyana_gadiya/presentation/widgets/core/button.dart';

class ProfileBasicInfo extends StatelessWidget {
  const ProfileBasicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        KkButton.block(
          "LOGIN",
          onPressed: () {},
        ),
        KkDropdownButton(),
        SizedBox(
          height: 16,
        ),
        KkDropdownButton()
      ],
    );
  }
}

class KkDropdownButton extends StatefulWidget {
  const KkDropdownButton({Key? key}) : super(key: key);

  @override
  State<KkDropdownButton> createState() => _KkDropdownButtonState();
}

class _KkDropdownButtonState extends State<KkDropdownButton> {
  String dropdownValue = '5';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      icon: const Icon(
        FeatherIcons.chevronDown,
        color: Colors.black,
      ),
      iconSize: 24,
      isExpanded: true,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      // underline: Container(
      //   height: 1,
      //   color: Colors.black,
      // ),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      // onChanged: null,
      items: <String>[
        'Select number',
        'One',
        'Two',
        'Free',
        'Four',
        "5",
        "10",
        "12",
        "14"
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(FeatherIcons.user),
                  Text(value),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
