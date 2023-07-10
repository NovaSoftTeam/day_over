import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/services/user_services/task_services/base_user_task.dart';
import 'package:day_over/product/services/user_services/task_services/fake_user_service.dart';
import 'package:day_over/product/services/user_services/task_services/firebase_task_service.dart';

enum AppMode { debug, release }

class UserTaskRepo extends BaseUserTask {
  final FakeUserTaskService _fakeService = FakeUserTaskService();
  final FirebaseTaskService _taskService = FirebaseTaskService();
  AppMode appMode = AppMode.release;

  @override
  Future<List<TaskModel>> getAll() async {
    if (appMode == AppMode.debug) {
      return await _fakeService.getAll();
    } else {
      return await _taskService.getAll();
    }
  }

  @override
  Future<void> createTask(String userId, TaskModel task) async {
    if (appMode == AppMode.debug) {
      await _fakeService.createTask(userId, task);
    } else {
      await _taskService.createTask(userId, task);
    }
  }
  
  @override
  Future<List<TaskModel>> getYourTasks(String userId) async{
    return await _taskService.getYourTasks(userId);
  }
}
