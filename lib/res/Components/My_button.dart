import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_neighbourhood/res/Constants/App_colors.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final bool isloading;
  const MyButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.isloading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Appcolors.primaryColor, Appcolors.secondaryColor],
              begin: Alignment.bottomCenter,
              end: Alignment.topRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 12,
                offset: const Offset(0, 4), // shadow spreads all around
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade500)),
        child: Center(
            child: isloading
                ? Center(
                    child: SpinKitThreeBounce(color: Colors.white, size: 30),
                  )
                : Text(
                    text,
                    style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
      ),
    );
  }
}
