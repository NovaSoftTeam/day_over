import 'package:day_over/product/models/task_model.dart';

abstract class BaseUserTask {
  Future<List<TaskModel>> getAll();
  Future<List<TaskModel>> getYourTasks(String userId);
  Future<void> createTask(String userId, List<TaskModel> tasks);
}
