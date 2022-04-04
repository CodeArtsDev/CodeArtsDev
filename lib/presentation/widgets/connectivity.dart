import 'package:flutter/material.dart';

class ConnectivityWidget extends StatelessWidget {
  const ConnectivityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No Internet Connection"));
  }
}
