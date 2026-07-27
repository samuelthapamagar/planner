import 'package:flutter/material.dart';
import 'package:planner/screens/dashboard_screen.dart';
import 'package:planner/screens/sign_up_screen.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                //Image
                Image.asset(
                  "assets/app_logo.png",
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 180,
                ),
                SizedBox(height: 27),
                //welcome back
                Text(
                  "Welcome Back  👋",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                //today is new day
                Text(
                  "Today is a new day. It's your day. You shape it. Sign in to start managing your tasks.",
                ),
                SizedBox(height: 20),
                Text('Email'),
                SizedBox(height: 5),

                //email
                CustomTextField(
                  hintText: "Please enter your email",
                  controller: _emailController,
                ),
                SizedBox(height: 20),
                //password
                Text('Password'),
                SizedBox(height: 5),
                CustomTextField(
                  hintText: "Please enter your password",
                  controller: _passwordController,
                  isPassword: true,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Color(0XFF1D4AE9)),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0XFF162D3A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't you have an account?", style: kBodyTextStyle),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: kBodyTextStyle.copyWith(
                          color: AppColors.themeColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
