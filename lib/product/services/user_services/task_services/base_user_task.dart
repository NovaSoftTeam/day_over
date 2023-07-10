import 'package:day_over/product/models/task_model.dart';

abstract class BaseUserTask {
  Future<List<TaskModel>> getAll();
  Future<void> createTask(String userId, TaskModel task);
  Future<List<TaskModel>> getYourTasks(String userId);
}
