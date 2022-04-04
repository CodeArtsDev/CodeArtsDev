import 'package:flutter/material.dart';

class CaVerticalDivier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: VerticalDivider(
        thickness: 2,
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }
}

class CaDivider extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0.1,
      thickness: 0.2,
      color: Colors.black.withOpacity(0.5),
    );
  }
}
