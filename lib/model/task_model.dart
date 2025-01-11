class Task {
  int? id;
  String? taskTitle;

  Task({this.id, this.taskTitle});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskTitle = json['task_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task_title'] = taskTitle;
    return data;
  }
}