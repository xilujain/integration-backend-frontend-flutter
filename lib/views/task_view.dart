import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integration_flutter/controllers/task_controller.dart';
import 'package:integration_flutter/model/task_model.dart';
import 'package:integration_flutter/widgets/task_card_widget.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.put(TaskController());
    TextEditingController taskController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter new task:"),
            Center(
                child: SizedBox(
                    width: 400, child: TextField(controller: taskController))),
            const SizedBox(height: 14),
            ElevatedButton(onPressed: () {}, child: const Text("Add task")),
            const SizedBox(height: 14),
            GetBuilder<TaskController>(builder: (controller) {
              return RefreshIndicator(
                onRefresh: () async {
                  await controller.refreshTasks();
                },
                child: GetBuilder<TaskController>(builder: (context) {
                  return FutureBuilder<List<Task>>(
                      future: controller.tasks,
                      builder: (context, snapshot) {
                        return Column(children: [
                          ...List.generate(
                            snapshot.data?.length ?? 0,
                            (index) {
                              return TaskCard(taskTitle: snapshot.data?[index]);
                            },
                          )
                        ]);
                      });
                }),
              );
            })
          ],
        ),
      ),
    );
  }
}
