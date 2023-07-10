import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/repository/user_task_repo.dart';
import 'package:day_over/product/services/user_services/task_services/base_user_task.dart';
import 'package:day_over/product/utility/firebase_custom_exception.dart';
import 'package:day_over/product/utility/user_custom_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllTaskNotifier extends StateNotifier<List<TaskModel>>
    implements BaseUserTask {
  AllTaskNotifier() : super([]);

  final UserTaskRepo _userRepo = UserTaskRepo();

  @override
  Future<List<TaskModel>> getAll() {
    try {
      return _userRepo.getAll();
    } catch (e) {
      throw UserCustomException(description: "taskler gelmedi.");
    }
  }

  void add(TaskModel task) {
    state = [...state, task];
  }

  void remove(String id) {
    state = state.where((element) => element.taskId != id).toList();
  }

  @override
  Future<List<TaskModel>> getYourTasks(String userId) async {
    try {
      return await _userRepo.getYourTasks(userId);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    }
  }

  @override
  Future<void> createTask(String userId, List<TaskModel> tasks) async {
    try {
      _userRepo.createTask(userId, tasks);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    }
  }
}

final allTaskProvider =
    StateNotifierProvider<AllTaskNotifier, List<TaskModel>>((ref) {
  return AllTaskNotifier();
});
