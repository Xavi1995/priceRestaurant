import 'package:flutter/material.dart';

class CustomImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.lineTo(0, height * 1.9 / 3);
    path.quadraticBezierTo(
        width / 13, height * 6 / 7, width / 3, height * 6 / 7);
    path.lineTo(width * 2 / 3, height * 6 / 7);
    path.quadraticBezierTo(width * 11.5 / 13, height * 6 / 7, width, height);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
