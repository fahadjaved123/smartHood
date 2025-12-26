import 'package:flutter/material.dart';
import 'package:smart_neighbourhood/View/Login.dart';

class AuthHelper {
  static Future<void> logout(BuildContext context) async {
    await Future.delayed(const Duration(microseconds: 30));

    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(microseconds: 30),
        pageBuilder: (_, animation, __) => LoginScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
      ),
      (route) => false,
    );
  }
}
