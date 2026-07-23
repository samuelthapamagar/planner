import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../widgets/to_do_element_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Welcome, ', style: kHeadingTextStyle1),
                    TextSpan(
                      text: 'John',
                      style: kHeadingTextStyle1.copyWith(
                        color: AppColors.themeColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                'You’ve got 7 tasks to do.',
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: AppColors.themeColor,
                ),
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView(
                  children: [
                    TodoElementWidget(),
                    SizedBox(height: 12),
                    TodoElementWidget(),
                    SizedBox(height: 12),
                    TodoElementWidget(),
                    SizedBox(height: 12),
                    TodoElementWidget(),
                    SizedBox(height: 12),
                    TodoElementWidget(),
                    SizedBox(height: 12),
                    TodoElementWidget(),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
