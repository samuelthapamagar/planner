import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.controller,
    this.hintText,
    this.isPassword = false,
    this.validator,
    super.key,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;

  final String? Function(String?)? validator;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? hidePassword : !hidePassword,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() => hidePassword = !hidePassword);
                },
                child: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        hintStyle: TextStyle(color: Color(0XFF8897AD)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0XFFD4D7E3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0XFF1D4AE9)),
        ),
      ),
      validator: widget.validator,
    );
  }
}
