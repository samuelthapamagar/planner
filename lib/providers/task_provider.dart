import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> get doneTasks => allTasks.where((t) => t.isDone).toList();
  List<TaskModel> get unDoneTasks => allTasks.where((t) => !t.isDone).toList();

  List<TaskModel> searchedTasks = [];

  List<TaskModel> allTasks = [];

  void addTask({required String title, String? description}) async {
    final newTask = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      description: description ?? '',
      isDone: false,
    );

    allTasks.add(newTask);

    await FirebaseFirestore.instance
        .collection('allTasks')
        .doc(newTask.id.toString())
        .set(newTask.toJson());

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
