import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class TodoElementWidget extends StatelessWidget {
  const TodoElementWidget({super.key});

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
        value: false,
        side: BorderSide(color: Colors.grey, width: 2),
        onChanged: (val) {},
      ),
      title: Text('Get the work done', style: kBodyTextStyle),
      showTrailingIcon: false,
      children: [
        Text(
          'This task should be done by tomorrow. This is awesome.',
          style: kBodyTextStyle.copyWith(color: AppColors.textColor02),
        ),
      ],
    );
  }
}
