import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_neighbourhood/View/Main_page.dart';
import 'package:smart_neighbourhood/View/Splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool repeat = prefs.getBool('isTrue') ?? false;

  runApp(MyApp(
    istrue: repeat,
  ));
}

class MyApp extends StatelessWidget {
  final bool istrue;
  const MyApp({super.key, required this.istrue});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Neighbourhood',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: istrue ? Mainpage() : SplashScreen(),
    );
  }
}
