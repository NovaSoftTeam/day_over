import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/repository/user_credit_repo.dart';
import 'package:day_over/product/repository/user_task_repo.dart';
import 'package:day_over/product/utility/firebase_custom_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum YourViewState { idle, busy }

class YourTaskNotifier extends StateNotifier<YourViewState> {
  YourTaskNotifier() : super(YourViewState.idle);

  final UserTaskRepo _userRepo = UserTaskRepo();
  final UserCreditRepo _creditRepo = UserCreditRepo();

  Future<void> deleteTask(String userId, TaskModel task) async {
    try {
      state = YourViewState.busy;
      await _userRepo.deleteTask(userId, task);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    } finally {
      state = YourViewState.idle;
    }
  }

  Future<List<TaskModel>> getYourTasks(String userId) async {
    try {
      return await _userRepo.getYourTasks(userId);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    } finally {}
  }

  Future<void> addCredit(String userId, int credit) async {
    try {
      state = YourViewState.busy;
      await _creditRepo.addCredit(userId, credit);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    } finally {
      state = YourViewState.idle;
    }
  }
}

final yourTaskProvider =
    StateNotifierProvider<YourTaskNotifier, YourViewState>((ref) {
  return YourTaskNotifier();
});

//Credit providers
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

  void reset(){
    state = 0;
  }
}

final creditProvider = StateNotifierProvider<CreditNotifier, int>((ref) {
  return CreditNotifier();
});
