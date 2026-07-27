import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // String? email;
  // String? name;
  //
  // String? password;
  // String? password2;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool hidePassword = true;
  bool hidePassword2 = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _password2Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign up', style: kHeadingTextStyle1)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(height: 10),
                //Image
                Image.asset(
                  "assets/app_logo.png",
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 100,
                ),
                SizedBox(height: 27),
                //welcome back
                Text(
                  "Welcome  👋",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                //today is new day
                Text("Please enter your details to continue"),
                SizedBox(height: 20),
                Text('Name'),
                SizedBox(height: 5),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Enter your name',
                ),
                SizedBox(height: 20),
                Text('Email'),
                SizedBox(height: 5),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Enter your email',
                ),

                SizedBox(height: 20),
                Text('Password'),
                SizedBox(height: 5),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Please enter your password',
                  isPassword: true,
                ),

                // TextFormField(
                //   controller: _passwordController,
                //   obscureText: hidePassword,
                //   decoration: InputDecoration(
                //     suffixIcon: GestureDetector(
                //       onTap: () {
                //         hidePassword = !hidePassword;
                //         setState(() {});
                //       },
                //       child: hidePassword
                //           ? Icon(Icons.visibility_off)
                //           : Icon(Icons.visibility),
                //     ),
                //     hintText: "Please enter your password",
                //     hintStyle: TextStyle(color: Color(0XFF8897AD)),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8),
                //       borderSide: BorderSide(color: Color(0XFFD4D7E3)),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8),
                //       borderSide: BorderSide(color: Color(0XFF1D4AE9)),
                //     ),
                //   ),
                //   validator: (password1) {
                //     if (_passwordController.text.isEmpty) {
                //       return 'Please enter the password';
                //     }
                //     if (_passwordController.text.length < 6) {
                //       return 'Password length must be greater than 6';
                //     }
                //   },
                // ),
                SizedBox(height: 20),
                Text('Confirm Password'),
                SizedBox(height: 5),
                CustomTextField(
                  controller: _password2Controller,
                  hintText: 'Confirm your password',
                  isPassword: true,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0XFF162D3A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: kBodyTextStyle),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
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
