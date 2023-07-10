import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/services/user_services/task_services/base_user_task.dart';
import 'package:uuid/uuid.dart';

class FakeUserTaskService extends BaseUserTask {
  List<TaskModel> taskList = [
    TaskModel(taskId: const Uuid().v4(), description: "Spora git", credit: 65),
    TaskModel(
        taskId: const Uuid().v4(), description: "Alışverişe git", credit: 25),
    TaskModel(taskId: const Uuid().v4(), description: "Kitap oku", credit: 142),
    TaskModel(
        taskId: const Uuid().v4(), description: "30 şınav çek", credit: 90),
  ];

  @override
  Future<List<TaskModel>> getAll() async {
    return taskList;
  }

  @override
  Future<void> createTask(String userId, List<TaskModel> tasks) async {
    for (var task in tasks) {
      taskList.add(task);
    }
  }

  @override
  Future<List<TaskModel>> getYourTasks(String userId) {
    throw UnimplementedError();
  }
}
