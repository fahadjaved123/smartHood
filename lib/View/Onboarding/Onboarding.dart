import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_neighbourhood/View/Login.dart';
import 'package:smart_neighbourhood/res/Components/My_button.dart';
import 'package:smart_neighbourhood/View/Signup_screen.dart';
import 'package:smart_neighbourhood/res/Constants/App_textStyle.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  final PageController pageController = PageController();
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> Onboardingdata = [
      {
        "title": "Discover",
        "subtitle":
            "Be Connected, Be Smart\nJoin a community dedicated to \n keeping each other safe",
        "image": "assets/Images/Processing-rafiki.png",
        "buttonText": "Next",
        "color": "#2196F3",
        "bgcolor": '#E3F2FD',
      },
      {
        "title": "Security",
        "subtitle":
            "Security Awareness\nReceive notifications in real-time of any \n danger in your area.",
        "image": "assets/Images/safty.png",
        "buttonText": "Next",
        "color": "#4CAF50",
        "bgcolor": "#FFEBEE"
      },
      {
        "title": "Community Support",
        "subtitle":
            "Stay United.\n Share updates, report issues, and help your \n neighbors instantly.",
        "image": "assets/Images/comunity.png",
        "buttonText": "Let's Start",
        "color": "#F44336",
        "bgcolor": "#E8F5E9",
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          itemCount: Onboardingdata.length,
          onPageChanged: (index) {
            setState(() {
              currentindex = index;
            });
          },
          controller: pageController,
          itemBuilder: (context, index) {
            final item = Onboardingdata[index];
            final parts = item['subtitle']!.split('\n');
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: Stack(
                children: [
                  // main title
                  Positioned(
                      top: 70,
                      left: 0,
                      right: 0,
                      child: Center(
                          child: Text(item['title'].toString(),
                              style: GoogleFonts.abel(
                                  fontSize: 25, fontWeight: FontWeight.bold)))),

                  // Button
                  Positioned(
                      top: 600,
                      left: 70,
                      right: 70,
                      child: MyButton(
                        onTap: () {
                          if (index < Onboardingdata.length - 1) {
                            pageController.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.bounceInOut);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          }
                        },
                        text: item['buttonText'].toString(),
                      )),

                  // Back button
                  Positioned(
                      top: 30,
                      left: 0,
                      right: 250,
                      child: IconButton(
                          onPressed: () {
                            pageController.previousPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut);
                          },
                          icon: Icon(
                            Iconsax.arrow_left_2,
                            size: 30,
                          ))),

                  // Skip button
                  Positioned(
                      top: 30,
                      left: 250,
                      right: 0,
                      child: TextButton(
                          onPressed: () {
                            pageController.jumpToPage(2);
                          },
                          child: Text(
                            "Skip",
                            style:
                                AppTextStyle.heading(16, color: Colors.black),
                          ))),

                  // Dot
                  Positioned(
                      top: 550,
                      left: 70,
                      right: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          Onboardingdata.length,
                          (dotIndex) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 6),
                            height: 8,
                            width: currentindex == dotIndex ? 20 : 8,
                            decoration: BoxDecoration(
                              color: currentindex == dotIndex
                                  ? Colors.deepPurple
                                  : Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                    top: 170,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 350,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400.withOpacity(0.6),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 4), // shadow spreads all around
                            ),
                          ],
                          color: Color(int.parse(
                                  item['color']!.replaceFirst('#', "0xff")))
                              .withOpacity(0.7),
                          borderRadius: BorderRadius.circular(80)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 90,
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: parts[0].trim() + '\n',
                                  style: AppTextStyle.heading(25,
                                      fontWeight: FontWeight.bold, height: 5),
                                ),
                                TextSpan(
                                  text: parts[1].trim() + '\n',
                                  style: AppTextStyle.heading(18,
                                      fontWeight: FontWeight.bold, height: 1),
                                ),
                                TextSpan(
                                  text: parts.length > 1 ? parts[2].trim() : '',
                                  style: AppTextStyle.heading(18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]))
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 230,
                      decoration: BoxDecoration(
                          color: Color(int.parse(
                                  item['bgcolor']!.replaceFirst('#', "0xff")))
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(80)),
                      child: Image.asset(
                        item['image'].toString(),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
