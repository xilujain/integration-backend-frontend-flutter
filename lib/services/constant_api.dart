class Api with ConstApi, TaskEndpoints{}

mixin ConstApi {
  String url = "localhost:8080";     //url of API
}

//task endpoints
mixin TaskEndpoints {
  String createTask = "/create-task";
  String updateTask = "/update-task";
  String deleteTask = "/delete-task";
  String readAllTasks = "/all-tasks";
}