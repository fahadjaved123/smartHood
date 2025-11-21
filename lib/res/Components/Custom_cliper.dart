import 'dart:ui';

import 'package:flutter/material.dart';

class customCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    final path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(30, size.height, size.width / 6, size.height - 30);
    path.quadraticBezierTo(
        size.width / 3, size.height / 2, size.width / 1.5, size.height - 60);
    path.quadraticBezierTo(
        size.width / 1.2, size.height - 20, size.width, size.height / 2);
    path.lineTo(size.width, size.height / 3);
    
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // normally false unless you want redrawing
    return false;
  }
}