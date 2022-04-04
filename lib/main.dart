import 'package:flutter/material.dart';
import 'package:kalyana_gadiya/presentation/screens/on_boarding.dart';
import 'package:kalyana_gadiya/presentation/screens/profile.dart';
import 'package:kalyana_gadiya/theme.dart';

import 'presentation/screens/registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: kkTheme,
      home: ProfileScreen(),
    );
  }
}
