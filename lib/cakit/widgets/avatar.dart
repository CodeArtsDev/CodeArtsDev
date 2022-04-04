import 'container.dart';
import 'text.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CaAvatar extends StatelessWidget {
  final ImageProvider<Object>? image;
  final IconData? icon;
  final String? text;
  final double? size;
  final List<Color> _avatarColors = [
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.red,
    Colors.pink,
    Colors.cyan,
    Colors.orange,
    Colors.brown
  ];

  CaAvatar({Key? key, this.image, this.text, this.icon, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 42,
      height: size ?? 42,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: image == null
            ? null
            : DecorationImage(image: image!, fit: BoxFit.fill),
      ),
      child: _getChild(),
    );
  }

  Widget? _getChild() {
    if (image == null) {
      if (icon != null) return _getIcon();

      if (text != null) return _getText();
    }
  }

  Widget _getText() {
    return CaContainer(
        paddingAll: 0,
        borderRadius: BorderRadius.circular(21),
        color: _getAvatarColor(),
        child: Center(
            child: CaText.h6(
          text!,
          color: Colors.white,
        )));
  }

  Widget _getIcon() {
    return CaContainer(
        paddingAll: 0,
        borderRadius: BorderRadius.circular(21),
        color: _getAvatarColor(),
        child: Center(
            child: Icon(
          icon!,
          color: Colors.white,
        )));
  }

  Color _getAvatarColor() {
    Random random = new Random();
    int i = random.nextInt(_avatarColors.length);
    return _avatarColors[i];
  }
}
