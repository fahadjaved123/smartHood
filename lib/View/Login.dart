import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_neighbourhood/Controllers/Auth_controller.dart';
import 'package:smart_neighbourhood/View/Signup_screen.dart';
import 'package:smart_neighbourhood/res/Components/Custom_cliper.dart';
import 'package:smart_neighbourhood/res/Components/MyAuth_button.dart';
import 'package:smart_neighbourhood/res/Components/My_button.dart';
import 'package:smart_neighbourhood/res/Components/My_textField.dart';
import 'package:smart_neighbourhood/res/Constants/App_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> isobscure = ValueNotifier<bool>(true);
  Authcontroller authcontroller = Get.put(Authcontroller());
  TextEditingController userNamecon = TextEditingController();
  TextEditingController passwordcon = TextEditingController();
  final FocusNode emailnode = FocusNode();
  final FocusNode passwordnode = FocusNode();
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: -100,
                right: 0,
                left: 0,
                child: ClipPath(
                  clipper: customCliper(),
                  child: Container(
                    height: 220,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Appcolors.primaryColor,
                          Appcolors.secondaryColor
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Appcolors.primaryColor
                              .withOpacity(0.7), // slightly darker
                          offset: const Offset(15, 2), // only left side shadow
                          blurRadius: 30,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: -110,
                left: -120,
                child: Container(
                  height: 180,
                  width: 310,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Appcolors.primaryColor,
                        Appcolors.secondaryColor
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(200),
                    boxShadow: [
                      BoxShadow(
                        color: Appcolors.primaryColor
                            .withOpacity(0.9), // shadow color
                        blurRadius: 20, // softness
                        spreadRadius: 2, // how wide
                        offset: const Offset(-10, 0), // **left side only**
                      ),
                    ],
                  ),
                ),
              ),

              // ===== Foreground Content =====

              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.2,
                    ),
                    // logo
                    Image.asset(
                      "assets/Images/logo.png",
                      width: width * 0.7,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    // Username

                    MyTextField(
                      isObscure: false,
                      prefixIcon: Icon(Iconsax.sms),
                      controller: authcontroller.emailcontroller.value,
                      hinttext: 'Email',
                      currfocusNode: authcontroller.emailfocus.value,
                      nextfocusNode: authcontroller.passwordfocus.value,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),

                    // Password

                    ValueListenableBuilder(
                        valueListenable: isobscure,
                        builder: (context, value, child) {
                          return MyTextField(
                            controller: authcontroller.passwordcontroller.value,
                            isObscure: true,
                            prefixIcon: Icon(Iconsax.password_check),
                            sufixIcon: GestureDetector(
                                onTap: () {
                                  isobscure.value = !isobscure.value;
                                },
                                child: Icon(isobscure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            hinttext: 'Password',
                            currfocusNode: authcontroller.passwordfocus.value,
                            nextfocusNode: authcontroller.passwordfocus.value,
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return "Password is required";
                              } else {
                                return null;
                              }
                            },
                          );
                        }),

                    const SizedBox(height: 15),
                    // Remember me and Forgot password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                                activeColor: Colors.purple.shade400,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         const ForgotPasswordScreen(),
                              //   ),
                              // );
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Colors.purple.shade400,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Login Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: MyButton(
                        onTap: () {},
                        text: "LOG IN",
                        isloading: authcontroller.isloading.value,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Create account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Create',
                            style: TextStyle(
                              color: Colors.purple.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Auth
                    Text("OR"),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MYAuthButton(
                            image: "assets/Images/google.png",
                          ),
                          MYAuthButton(
                            image: "assets/Images/facebook.png",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
