import 'package:flutter/cupertino.dart';

import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> get doneTasks => allTasks.where((t) => t.isDone).toList();
  List<TaskModel> get unDoneTasks => allTasks.where((t) => !t.isDone).toList();

  List<TaskModel> searchedTasks = [];

  List<TaskModel> allTasks = [
    TaskModel(
      id: 1,
      title: 'Design sign up flow',
      description:
          "By the time a prospect arrives at your signup page, in most cases, they've already By the time a prospect arrives at your signup page, in most cases.",
      isDone: false,
    ),
    TaskModel(
      id: 2,
      title: 'Design use case page',
      description:
          'This task should be done by tomorrow By the time a prospect arrives at your signup page, in most cases',
      isDone: true,
    ),
    TaskModel(
      id: 3,
      title: 'Test Wireframe',
      description: 'This task should be done by tomorrow',
      isDone: false,
    ),
    TaskModel(
      id: 4,
      title: 'Create new task UI flow',
      description: 'This task should be done by tomorrow',
      isDone: true,
    ),
    TaskModel(
      id: 5,
      title: 'Collect project assets',
      description: 'This task should be done by tomorrow',
      isDone: true,
    ),
    // TaskModel(
    //   title: 'Collect Skills list',
    //   description: 'This task should be done by tomorrow',
    //   isDone: false,
    // ),
    // TaskModel(
    //   title: 'Design use case page',
    //   description:
    //       'This task should be done by tomorrow By the time a prospect arrives at your signup page, in most cases',
    //   isDone: false,
    // ),
    // TaskModel(
    //   title: 'Test Wireframe',
    //   description: 'This task should be done by tomorrow',
    //   isDone: false,
    // ),
    // TaskModel(
    //   title: 'Create new task UI flow',
    //   description: 'This task should be done by tomorrow',
    //   isDone: false,
    // ),
    // TaskModel(
    //   title: 'Collect project assets',
    //   description: 'This task should be done by tomorrow',
    //   isDone: false,
    // ),
    // TaskModel(
    //   title: 'Collect Skills list',
    //   description: 'This task should be done by tomorrow',
    //   isDone: false,
    // ),
    // TaskModel(
    //   title: 'Design use case page',
    //   description:
    //       'This task should be done by tomorrow By the time a prospect arrives at your signup page, in most cases',
    //   isDone: false,
    // ),
    // TaskModel(
    //   title: 'Test Wireframe',
    //   description: 'This task should be done by tomorrow',
    //   isDone: false,
    // ),
    // TaskModel(
    //   title: 'Create new task UI flow',
    //   description: 'This task should be done by tomorrow',
    //   isDone: false,
    // ),
    // TaskModel(
    //   title: 'Collect project assets',
    //   description: 'This task should be done by tomorrow',
    //   isDone: false,
    // ),
    // TaskModel(
    //   title: 'Collect Skills list',
    //   description: 'This task should be done by tomorrow',
    //   isDone: false,
    // ),
  ];

  void addTask({required String title, String? description}) {
    allTasks.add(
      TaskModel(
        id: DateTime.now().millisecondsSinceEpoch,
        title: title,
        description: description ?? '',
        isDone: false,
      ),
    );
    notifyListeners();
  }

  void deleteTask(int taskId) {
    allTasks.removeWhere((t) => t.id == taskId);
    notifyListeners();
  }

  void deleteDoneTasks() {
    allTasks.removeWhere((t) => t.isDone);
    notifyListeners();
  }

  void toggleDone({required int taskId}) {
    final index = allTasks.indexWhere((t) => t.id == taskId);

    if (index == -1) {
      return;
    }

    final originalTask = allTasks[index];
    final originalDoneState = originalTask.isDone;
    final updatedTask = originalTask.copyWith(isDone: !originalDoneState);
    allTasks[index] = updatedTask;

    notifyListeners();

    final searchedTaskIndex = searchedTasks.indexWhere((t) => t.id == taskId);
    if (searchedTaskIndex == -1) {
      return;
    }
    final originalSearchedTask = allTasks[index];
    final originalSearchedTaskDoneState = originalTask.isDone;
    final updatedSearchedTask = originalSearchedTask.copyWith(
      isDone: !originalSearchedTaskDoneState,
    );
    searchedTasks[index] = updatedSearchedTask;
    notifyListeners();
  }

  void searchTask({required String searchedText}) {
    if (searchedText.isEmpty) {
      searchedTasks.clear();
      notifyListeners();
      return;
    }

    searchedTasks = allTasks
        .where(
          (t) => t.title.toLowerCase().contains(searchedText.toLowerCase()),
        )
        .toList();
    notifyListeners();
  }
}
