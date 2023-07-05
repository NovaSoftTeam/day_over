import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/services/user_services/base_user.dart';

class FakeUserService extends BaseUser{
  final List<Task> _taskList = [
    Task("Spora git", 30),
    Task("30 dakika koş", 120),
    Task("50 şınav çek", 90),
  ];

  @override
  Future<List<Task>> getAll() async {
    return _taskList;
  }
}
