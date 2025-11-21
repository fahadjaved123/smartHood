import 'package:flutter/material.dart';

class MYAuthButton extends StatelessWidget {
  final String image;
  const MYAuthButton({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(5, 5),
              spreadRadius: 1,
              blurRadius: 10),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-5, -5),
              spreadRadius: 1,
              blurRadius: 10)
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 2),
      ),
      child: Image.asset(
        image,
        height: 35,
        width: 35,
        fit: BoxFit.contain,
      ),
    );
  }
}
