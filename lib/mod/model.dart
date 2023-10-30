import 'package:flutter/material.dart';

class CustomRoundedDiagonalPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height); // Start at the bottom-left corner
    path.lineTo(size.width, 0); // Line to the top-right corner
    path.lineTo(size.width, size.height); // Line to the bottom-right corner

    // Create a rounded corner at the bottom-left
    path.arcToPoint(
      Offset(0, size.height),
      radius: Radius.circular(20.0),
    );

    path.close(); // Close the path to create a full shape
    return path;
  }

  @override
  bool shouldReclip(covariant CustomRoundedDiagonalPathClipper oldClipper) {
    return false;
  }
}
