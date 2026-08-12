import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final String allTaskCollection = 'allTasks';

  List<TaskModel> get doneTasks => allTasks.where((t) => t.isDone).toList();
  List<TaskModel> get unDoneTasks => allTasks.where((t) => !t.isDone).toList();

  List<TaskModel> searchedTasks = [];

  List<TaskModel> allTasks = [];

  bool isLoading = false;

  //fetch all tasks from firebase
  void fetchAllTasks() async {
    isLoading = true;
    notifyListeners();

    allTasks.clear();

    var querySnapshot = await _fireStore
        .collection(allTaskCollection)
        .where("createdBy", isEqualTo: _auth.currentUser!.email!)
        .get();

    var docs = querySnapshot.docs;

    for (var doc in docs) {
      var taskData = doc.data();
      TaskModel task = TaskModel.fromJson(taskData);
      allTasks.add(task);
    }

    isLoading = false;
    notifyListeners();
  }

  //add new task
  void addTask({required String title, String? description}) async {
    final newTask = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch,
      createdBy: _auth.currentUser!.email!,
      title: title,
      description: description ?? '',
      isDone: false,
    );

    allTasks.add(newTask);

    //save to firebase
    await _fireStore
        .collection(allTaskCollection)
        .doc(newTask.id.toString())
        .set(newTask.toJson());

    notifyListeners();
  }

  void deleteTask(int taskId) {
    allTasks.removeWhere((t) => t.id == taskId);
    _fireStore.collection(allTaskCollection).doc(taskId.toString()).delete();
    notifyListeners();
  }

  void deleteDoneTasks() {
    for (var t in doneTasks) {
      _fireStore.collection(allTaskCollection).doc(t.id.toString()).delete();
    }

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

    _fireStore.collection(allTaskCollection).doc(taskId.toString()).update({
      "isDone": updatedTask.isDone,
    });

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
