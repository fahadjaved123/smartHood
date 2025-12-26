import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_neighbourhood/View/Login.dart';
import 'package:smart_neighbourhood/res/Components/My_button.dart';
import 'package:smart_neighbourhood/res/Constants/App_textStyle.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  final PageController pageController = PageController();
  int currentindex = 0;
  Future<void> Savevalue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isTrue', true);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
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
      body: Column(
        children: [
          // Back button
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16, vertical: height * 0.07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button
                IconButton(
                  icon: const Icon(Iconsax.arrow_left_2, size: 28),
                  onPressed: () {
                    if (currentindex > 0) {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),

                // Skip Button
                TextButton(
                  onPressed: () {
                    pageController.jumpToPage(
                      Onboardingdata.length - 1,
                    );
                  },
                  child: Text(
                    "Skip",
                    style: AppTextStyle.heading(16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: PageView.builder(
                itemCount: Onboardingdata.length,
                onPageChanged: (index) async {
                  setState(() {
                    currentindex = index;
                  });
                  if (index == Onboardingdata.length - 1) {
                    await Savevalue();
                  }
                },
                controller: pageController,
                itemBuilder: (context, index) {
                  final item = Onboardingdata[index];
                  final parts = item['subtitle']!.split('\n');

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Stack(
                      children: [
                        // main title
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                                child: Text(item['title'].toString(),
                                    style: GoogleFonts.abel(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)))),

                        Positioned(
                          top: 100,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 350,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.4)),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Colors.grey.shade400.withOpacity(0.6),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: const Offset(
                                        0, 4), // shadow spreads all around
                                  ),
                                ],
                                color: Color(int.parse(item['color']!
                                        .replaceFirst('#', "0xff")))
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
                                            fontWeight: FontWeight.bold,
                                            height: 5),
                                      ),
                                      TextSpan(
                                        text: parts[1].trim() + '\n',
                                        style: AppTextStyle.heading(18,
                                            fontWeight: FontWeight.bold,
                                            height: 1),
                                      ),
                                      TextSpan(
                                        text: parts.length > 1
                                            ? parts[2].trim()
                                            : '',
                                        style: AppTextStyle.heading(18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]))
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 20,
                          right: 20,
                          child: Container(
                            height: 230,
                            decoration: BoxDecoration(
                                color: Color(int.parse(item['bgcolor']!
                                        .replaceFirst('#', "0xff")))
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
          ),
          // Dot
          Padding(
            padding: EdgeInsets.only(bottom: 30),
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
            child: MyButton(
              text: Onboardingdata[currentindex]['buttonText']!,
              onTap: () {
                if (currentindex < Onboardingdata.length - 1) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
