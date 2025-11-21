import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController {
  final emailcontroller = TextEditingController().obs;
  final passwordcontroller = TextEditingController().obs;
  final namecontroller = TextEditingController().obs;
  final emailfocus = FocusNode().obs;
  final passwordfocus = FocusNode().obs;
  final namefocus = FocusNode().obs;
  RxBool isloading = false.obs;
  // for login
  void login() {
    isloading.value = true;
  }
}
