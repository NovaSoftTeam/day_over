import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/services/user_services/task_services/base_user_task.dart';
import 'package:day_over/product/services/user_services/task_services/fake_user_service.dart';

enum AppMode { debug, release }

class UserTaskRepo extends BaseUserTask {
  final FakeUserTaskService _fakeService = FakeUserTaskService();
  AppMode appMode = AppMode.debug;

  @override
  Future<List<TaskModel>> getAll() async {
    if (appMode == AppMode.debug) {
      return await _fakeService.getAll();
    } else {
      return await _fakeService.getAll(); //şu anlık hata almamak için
    }
  }
}
