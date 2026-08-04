import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_constants.dart';
import '../providers/task_provider.dart';
import '../widgets/delete_task_element.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allTasks = context.watch<TaskProvider>().doneTasks;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.read<TaskProvider>().deleteTask(3);
      //   },
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Completed Tasks', style: kHeadingTextStyle1),
                  GestureDetector(
                    onTap: () {},
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<TaskProvider>().deleteDoneTasks();
                      },
                      child: Text(
                        'Delete all',
                        style: kBodyTextStyle.copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: allTasks.length,
                  itemBuilder: (context, index) =>
                      DeleteTaskElement(task: allTasks[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
