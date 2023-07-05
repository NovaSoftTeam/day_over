import 'package:day_over/product/models/task_model.dart';

abstract class BaseUser {
  Future<List<Task>> getAll();
}
