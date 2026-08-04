class TaskModel {
  const TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  final int id;
  final String title;
  final String description;
  final bool isDone;

  TaskModel copyWith({String? title, String? description, bool? isDone}) =>
      TaskModel(
        id: this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
      );
}
