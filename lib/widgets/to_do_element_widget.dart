import 'package:flutter/material.dart';
import 'package:planner/models/task_model.dart';
import 'package:planner/providers/task_provider.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class TodoElementWidget extends StatelessWidget {
  const TodoElementWidget({required this.task, super.key});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      collapsedBackgroundColor: AppColors.backGroundGrey,
      backgroundColor: AppColors.backGroundGrey,
      childrenPadding: EdgeInsets.only(left: 60, top: 10, bottom: 10),
      leading: Checkbox(
        value: task.isDone,
        side: BorderSide(color: Colors.grey, width: 2),
        onChanged: (val) {
          context.read<TaskProvider>().toggleDone(taskId: task.id);
        },
      ),
      title: Text(task.title, style: kBodyTextStyle),
      showTrailingIcon: false,
      children: [
        Text(
          task.description,
          style: kBodyTextStyle.copyWith(color: AppColors.textColor02),
        ),
      ],
    );
  }
}
