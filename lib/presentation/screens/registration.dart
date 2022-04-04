import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:kalyana_gadiya/cakit/widgets/text_field.dart';
import 'package:kalyana_gadiya/presentation/widgets/core/form/drop_down.dart';
import 'package:kalyana_gadiya/presentation/widgets/core/form/radio_button.dart';
import 'package:kalyana_gadiya/presentation/widgets/core/form/switch.dart';
import 'package:kalyana_gadiya/presentation/widgets/core/form/text_field.dart';

import '../widgets/core/button.dart';
import '../widgets/core/navigation/multi_step_pages.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class KeyValuePair {
  final int id;
  final String name;

  KeyValuePair(this.id, this.name);
}

class BasicDetailsPage extends StatelessWidget {
  final List<KeyValuePair> accountFor = [
    KeyValuePair(1, 'Myself'),
    KeyValuePair(2, 'Daugther'),
    KeyValuePair(3, 'Son'),
    KeyValuePair(4, 'Relative'),
    KeyValuePair(5, 'Myself'),
    KeyValuePair(6, 'Daugther'),
    KeyValuePair(7, 'Son'),
    KeyValuePair(8, 'Relative'),
    KeyValuePair(9, 'Myself'),
    KeyValuePair(10, 'Daugther'),
    KeyValuePair(11, 'Son'),
    KeyValuePair(12, 'Relative'),
    KeyValuePair(2, 'Daugther'),
    KeyValuePair(3, 'Son'),
    KeyValuePair(4, 'Relative'),
    KeyValuePair(5, 'Myself'),
    KeyValuePair(6, 'Daugther'),
    KeyValuePair(7, 'Son'),
    KeyValuePair(8, 'Relative'),
    KeyValuePair(9, 'Myself'),
    KeyValuePair(10, 'Daugther'),
    KeyValuePair(11, 'Son'),
    KeyValuePair(12, 'Relative')
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // // KkDropDown<KeyValuePair>(
          // //     options: accountFor,
          // //     labelProvider: (v) => v.name,
          // //     selectedText: "Myself",
          // //     onSelected: (value) {}),
          // // const SizedBox(
          // //   height: 16,
          // // ),
          // // KkTextField(),
          // // const SizedBox(
          // //   height: 16,
          // // ),
          KkTextField(
            labelText: "User Name",
            textFieldType: CaTextFieldType.name,
            controller: TextEditingController(text: "Gopalakrishna"),
          ),
          const SizedBox(
            height: 16,
          ),
          KkTextField(),
          const SizedBox(
            height: 16,
          ),
          KkTextField(
            textFieldType: CaTextFieldType.mobileNumber,
            errorMessage: "Phone number is required",
          ),
          KkRadioButton(title: "Male", value: 'm', groupValue: 'm'),
          KkRadioButton(title: "Female", value: 'f', groupValue: 'f'),
          KkSwitch(
            title: "Testing",
            value: true,
            activeColor: Colors.blue,
          )
        ],
      ),
    );
  }
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Kalyana Gadiya")),
        body: MultiStepScreen(
          pages: [
            MultiStepPage(
              widget: BasicDetailsPage(),
              leftButton: KkButton.text("Previous",
                  onPressed: () {}, textColor: Colors.red),
              rightButton: KkButton.text("Next", onPressed: () {}),
            ),
            MultiStepPage(
              widget: Text("page 2"),
              leftButton: KkButton.text("Previous",
                  onPressed: () {}, textColor: Colors.red),
              rightButton: KkButton.text("Next", onPressed: () {}),
            ),
            MultiStepPage(
              widget: Text("page3"),
              leftButton: KkButton.text("Previous",
                  onPressed: () {}, textColor: Colors.red),
              rightButton: KkButton.text("Next", onPressed: () {}),
            ),
          ],
        ));
  }
}
