import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planner/models/task_model.dart';
import 'package:planner/providers/task_provider.dart';
import 'package:planner/widgets/empty_task_widget.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../widgets/to_do_element_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final allTasks = context.watch<TaskProvider>().allTasks;
    final undoneTasks = context.watch<TaskProvider>().unDoneTasks;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Welcome, ', style: kHeadingTextStyle1),
                    TextSpan(
                      text:
                          FirebaseAuth.instance.currentUser?.displayName ??
                          'No user',
                      style: kHeadingTextStyle1.copyWith(
                        color: AppColors.themeColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                'You’ve got ${undoneTasks.length} tasks to do.',
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: AppColors.themeColor,
                ),
              ),
              SizedBox(height: 32),
              if (allTasks.isEmpty) Expanded(child: EmptyTaskWidget()),

              if (allTasks.isNotEmpty)
                Expanded(
                  child: ListView.separated(
                    itemCount: allTasks.length,
                    separatorBuilder: (_, index) => SizedBox(height: 12),
                    itemBuilder: (_, index) =>
                        TodoElementWidget(task: allTasks[index]),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
