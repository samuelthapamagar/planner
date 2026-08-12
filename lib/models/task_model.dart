// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  final String title;
  final String description;
  final bool isDone;
  final int id;

  TaskModel({
    required this.title,
    required this.description,
    required this.isDone,
    required this.id,
  });

  TaskModel copyWith({
    String? title,
    String? description,
    bool? isDone,
    int? id,
  }) => TaskModel(
    title: title ?? this.title,
    description: description ?? this.description,
    isDone: isDone ?? this.isDone,
    id: id ?? this.id,
  );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    title: json["title"],
    description: json["description"],
    isDone: json["isDone"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "isDone": isDone,
    "id": id,
  };
}
