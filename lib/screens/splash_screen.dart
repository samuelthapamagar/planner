import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner/constants/app_constants.dart';
import 'package:planner/screens/dashboard_screen.dart';
import 'package:planner/screens/login_screen.dart';
import 'package:planner/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //logic
  // first time opened app-> Onboarding Screen
  //if not first time then check:  login status
  // if logged in -> dashboard screen
  // if not logged in then -> login screen

  void init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool firstTime = prefs.getBool('firstTime') ?? true;

    if (firstTime) {
      navigateToOnboardingScreen();
    } else {
      final currentUser = FirebaseAuth.instance.currentUser;
      final isLoggedIn = currentUser != null;

      if (isLoggedIn) {
        //if logged in -> dashboard screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DashboardScreen()),
        );
      } else {
        // if not logged in then -> login screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LoginScreen()),
        );
      }

      //if not first time then check:  login status
      // if logged in -> dashboard screen
      // if not logged in then -> login screen
    }
  }

  void navigateToOnboardingScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
      );
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/app_logo.png', height: 170)),
    );
  }
}
