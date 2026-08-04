import 'package:flutter/material.dart';
import 'package:planner/providers/task_provider.dart';
import 'package:planner/screens/login_screen.dart';
import 'package:planner/screens/onboarding_screen.dart';
import 'package:planner/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        title: 'Planner',
        debugShowCheckedModeBanner: false,
        home: const OnboardingScreen(),
      ),
    );
  }
}
