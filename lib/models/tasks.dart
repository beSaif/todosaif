const String tableTasks = 'tasks';

class TaskFields {
  static final List<String> values = [
    /// Add all fields
    id, taskName, priority, timing
  ];

  static const String id = '_id';
  static const String taskName = 'taskName';
  static const String priority = 'priority';
  static const String timing = 'timing';
}

class Task {
  final int? id;
  final String taskName;
  final String priority;
  final String timing;

  const Task({
    this.id,
    required this.taskName,
    required this.priority,
    required this.timing,
  });

  Task copy({
    int? id,
    String? taskName,
    String? priority,
    String? timing,
  }) =>
      Task(
        id: id ?? this.id,
        taskName: taskName ?? this.taskName,
        priority: priority ?? this.priority,
        timing: timing ?? this.timing,
      );

  static Task fromJson(Map<String, Object?> json) => Task(
        id: json[TaskFields.id] as int?,
        taskName: json[TaskFields.taskName] as String,
        priority: json[TaskFields.priority] as String,
        timing: json[TaskFields.timing] as String,
      );

  Map<String, Object?> toJson() => {
        TaskFields.id: id,
        TaskFields.taskName: taskName,
        TaskFields.priority: priority,
        TaskFields.timing: timing,
      };
}
