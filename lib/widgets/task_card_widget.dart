import 'package:flutter/material.dart';
import 'package:integration_flutter/model/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, this.taskTitle});

  final Task? taskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(taskTitle?.taskTitle ?? "",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
