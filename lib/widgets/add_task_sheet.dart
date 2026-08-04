import 'package:flutter/material.dart';
import 'package:planner/providers/task_provider.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Color? buttonColor;
  Color? buttonTextColor = AppColors.textColor02;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //Title
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Add a title',
                hintStyle: TextStyle(color: AppColors.textColor02),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              validator: (_) {
                if (_titleController.text.isEmpty) {
                  return 'Title is required';
                }
                return null;
              },

              onChanged: (_) {
                if (_titleController.text.isNotEmpty) {
                  buttonColor = AppColors.themeColor;
                  buttonTextColor = AppColors.white;
                } else {
                  buttonColor = null;
                  buttonTextColor = AppColors.textColor02;
                }

                setState(() {});
              },
            ),
            //Description
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.edit, size: 22, color: Colors.grey),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    maxLines: 5,
                    // maxLength: 10,
                    controller: _descriptionController,

                    decoration: InputDecoration(
                      hintText: 'Add a description',
                      hintStyle: TextStyle(color: AppColors.textColor02),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.themeColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            //Create button
            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                //if validated then create new task
                final validated = _formKey.currentState?.validate() ?? false;

                if (validated) {
                  context.read<TaskProvider>().addTask(
                    title: _titleController.text,
                    description: _descriptionController.text,
                  );
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Create',
                style: kBodyTextStyle.copyWith(color: buttonTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
