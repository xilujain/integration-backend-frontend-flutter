import 'package:get/get.dart';
import 'package:integration_flutter/api/all_tasks_response.dart';
import 'package:integration_flutter/model/task_model.dart';

class TaskController extends GetxController {
  late Future<List<Task>> tasks;

  @override
  void onInit() {
    fetchAllTasks();
    super.onInit();
  }

  void fetchAllTasks() {
    tasks = allTasksResponse();
    update();
  }

  Future<void> refreshTasks() async {
    fetchAllTasks();
  }
}