import 'package:flutter/material.dart';
import 'package:smart_neighbourhood/res/Constants/App_colors.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final Widget prefixIcon;
  final Widget? sufixIcon;
  final bool isObscure;
  String? Function(String?)? validator;
  final FocusNode currfocusNode;
  final FocusNode nextfocusNode;
  MyTextField(
      {super.key,
      this.sufixIcon,
      required this.validator,
      required this.currfocusNode,
      required this.nextfocusNode,
      required this.isObscure,
      required this.controller,
      required this.hinttext,
      required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade400.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 12,
              offset: const Offset(0, 4), // shadow spreads all around
            ),
          ],
        ),
        child: TextFormField(
          focusNode: currfocusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
              hintText: hinttext,
              labelText: hinttext,
              suffixIcon: sufixIcon,
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                  ))),
          validator: (value) => validator!(value),
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(nextfocusNode);
          },
        ),
      ),
    );
  }
}
