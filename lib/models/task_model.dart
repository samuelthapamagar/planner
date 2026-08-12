// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  final String title;
  final String createdBy;
  final String description;
  final bool isDone;
  final int id;

  TaskModel({
    required this.title,
    required this.createdBy,
    required this.description,
    required this.isDone,
    required this.id,
  });

  TaskModel copyWith({
    String? title,
    String? createdBy,
    String? description,
    bool? isDone,
    int? id,
  }) => TaskModel(
    title: title ?? this.title,
    createdBy: createdBy ?? this.createdBy,
    description: description ?? this.description,
    isDone: isDone ?? this.isDone,
    id: id ?? this.id,
  );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    title: json["title"],
    createdBy: json["createdBy"],
    description: json["description"],
    isDone: json["isDone"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "createdBy": createdBy,
    "description": description,
    "isDone": isDone,
    "id": id,
  };
}
