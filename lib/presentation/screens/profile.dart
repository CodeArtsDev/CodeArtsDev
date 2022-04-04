import 'package:flutter/material.dart';
import 'package:kalyana_gadiya/presentation/widgets/profile/basic_info.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ProfileBasicInfo(),
        ));
  }
}
