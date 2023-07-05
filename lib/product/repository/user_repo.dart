import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/services/user_services/base_user.dart';
import 'package:day_over/product/services/user_services/fake_user_service.dart';

enum AppMode { debug, release }

class UserRepo extends BaseUser {
  final FakeUserService _fakeService = FakeUserService();
  AppMode appMode = AppMode.debug;

  @override
  Future<List<Task>> getAll() async {
    if (appMode == AppMode.debug) {
      return await _fakeService.getAll();
    } else {
      return await _fakeService.getAll();  //şu anlık hata almamak için
    }
  }
}
