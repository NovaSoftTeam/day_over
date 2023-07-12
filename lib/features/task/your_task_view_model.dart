import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/repository/user_task_repo.dart';
import 'package:day_over/product/utility/firebase_custom_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum YourTaskViewState { idle, busy }

class YourTaskNotifier extends StateNotifier<YourTaskViewState> {
  YourTaskNotifier() : super(YourTaskViewState.idle);

  final UserTaskRepo _userRepo = UserTaskRepo();

  Future<void> deleteTask(String userId, TaskModel task) async {
    try {
      state = YourTaskViewState.busy;
      await _userRepo.deleteTask(userId, task);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    } finally {
      state = YourTaskViewState.idle;
    }
  }

  Future<List<TaskModel>> getYourTasks(String userId) async {
    try {
      return await _userRepo.getYourTasks(userId);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    } finally {}
  }
}

final yourTaskProvider =
    StateNotifierProvider<YourTaskNotifier, YourTaskViewState>((ref) {
  return YourTaskNotifier();
});

class CreditNotifier extends StateNotifier<int> {
  CreditNotifier() : super(0);

  void increment(int credit) {
    state = state + credit;
  }

  void decrement(int credit) {
    if (state > credit) {
      state = state - credit;
    } else {
      state = 0;
    }
  }
}

final creditProvider = StateNotifierProvider<CreditNotifier, int>((ref) {
  return CreditNotifier();
});
