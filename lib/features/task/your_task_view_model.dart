import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/repository/user_task_repo.dart';
import 'package:day_over/product/services/user_services/task_services/base_user_task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YourTaskNotifier extends StateNotifier<List<TaskModel>> implements BaseUserTask{
  YourTaskNotifier(): super([]);

  UserTaskRepo _userRepo = UserTaskRepo();
  
  @override
  Future<void> createTask(String userId, TaskModel task) {
    // TODO: implement createTask
    throw UnimplementedError();
  }
  
  @override
  Future<List<TaskModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
  
  @override
  Future<List<TaskModel>> getYourTasks(String userId) {
    // TODO: implement getYourTasks
    throw UnimplementedError();
  }
  
}