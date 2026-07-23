import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class DeleteTaskElement extends StatelessWidget {
  const DeleteTaskElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.backGroundGrey,
      ),
      child: Row(
        children: [
          // Checkbox(
          //   value: true,
          //   side: BorderSide(color: Colors.grey, width: 2),
          //   onChanged: (val) {},
          // ),
          SizedBox(width: 16),
          Text(
            'The task is done',
            style: kBodyTextStyle.copyWith(color: AppColors.textColor02),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
