import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget navItem({
  required IconData icon,
  required bool isimage,
  String? image,
  required String label,
  required int index,
  required int bottomIndex,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      bottomIndex != index
          ? isimage
              ? Image.asset(
                  image ?? '',
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                )
              : Icon(icon, color: Colors.white, size: 27)
          : isimage
              ? Image.asset(
                  image ?? '',
                  width: 50,
                  fit: BoxFit.cover,
                )
              : Icon(icon, color: Colors.white, size: 30),
      isimage ? SizedBox(height: 0) : SizedBox(height: 4),
      if (bottomIndex != index)
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
    ],
  );
}
