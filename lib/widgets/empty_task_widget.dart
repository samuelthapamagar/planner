import 'package:flutter/material.dart';
import 'package:planner/constants/app_colors.dart';
import 'package:planner/widgets/add_task_sheet.dart';

class EmptyTaskWidget extends StatelessWidget {
  const EmptyTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset('assets/icons/no_task.png')),
        SizedBox(height: 24),
        Text('You have no task listed.'),
        SizedBox(height: 24),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              builder: (context) {
                return AddTaskSheet();
              },
            );
          },
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.themeColor.withAlpha(100),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.add), Text('Create Task')],
            ),
          ),
        ),
      ],
    );
  }
}
