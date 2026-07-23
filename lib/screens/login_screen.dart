import 'package:flutter/material.dart';
import 'package:planner/screens/dashboard_screen.dart';
import 'package:planner/screens/sign_up_screen.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Please enter your email",
                    hintStyle: TextStyle(color: Color(0XFF8897AD)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0XFFD4D7E3)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0XFF1D4AE9)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),

                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter your email';
                    }

                    if (val.length < 5) {
                      return 'Email must be longer than 5 characters.';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20),
                //password
                Text('Password'),
                SizedBox(height: 5),
                TextFormField(
                  obscureText: hidePassword,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "Please enter your password",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() => hidePassword = !hidePassword);
                      },
                      child: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    hintStyle: TextStyle(color: Color(0XFF8897AD)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0XFFD4D7E3)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0XFF1D4AE9)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),

                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (val.length < 7) {
                      return 'Password must be longet than 6 characters';
                    }

                    return null;
                  },
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
