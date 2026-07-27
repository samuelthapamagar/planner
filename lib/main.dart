import 'package:flutter/material.dart';
import 'package:planner/screens/login_screen.dart';
import 'package:planner/screens/onboarding_screen.dart';
import 'package:planner/screens/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planner',
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
