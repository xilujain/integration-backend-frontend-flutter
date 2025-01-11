import 'package:dio/dio.dart';
import 'package:integration_flutter/model/task_model.dart';
import 'package:integration_flutter/services/constant_api.dart';

Future<List<Task>> allTasksResponse() async {
  final dio = Dio();
  try {
    final response = await dio.get(Api().url + Api().readAllTasks);
    if (response.data is List) {
      return (response.data as List).map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception("Unexpected response format");
    }
  } on DioException catch (e) {
    final errorMessage = e.response?.data ?? "Unknown error";
    return errorMessage;
  } catch (e) {
    throw Exception(e.toString());
  }
}
