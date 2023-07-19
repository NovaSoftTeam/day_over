import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/repository/user_task_repo.dart';
import 'package:day_over/product/utility/firebase_custom_exception.dart';
import 'package:day_over/product/utility/user_custom_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AllTaskViewState { idle, busy }

class AllTaskNotifier extends StateNotifier<AllTaskViewState> {
  AllTaskNotifier() : super(AllTaskViewState.idle);

  final UserTaskRepo _userRepo = UserTaskRepo();

  Future<List<TaskModel>> getAll() {
    try {
      return _userRepo.getAll();
    } catch (e) {
      throw UserCustomException(description: "$e");
    }
  }

  Future<void> createTask(String userId, List<TaskModel> tasks) async {
    try {
      state = AllTaskViewState.busy;
      Future.delayed(const Duration(microseconds: 3000));
      _userRepo.createTask(userId, tasks);
      //state = [];
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    } finally {
      state = AllTaskViewState.idle;
    }
  }

  Future<List<TaskModel>> getYourTasks(String userId) async {
    try {
      return await _userRepo.getYourTasks(userId);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    }
  }

  Future<List<TaskModel>> filteredList(String userId) async {
    List<TaskModel> allTasks = await getAll();
    List<TaskModel> yourTasks = await getYourTasks(userId);

    List<TaskModel> filteredList = [];

    for (var item in allTasks) {
      bool control = true;
      for (var item2 in yourTasks) {
        if (item.taskId == item2.taskId) {
          control = false;
        }
      }
      if (control) {
        filteredList.add(item);
      }
      control = true;
    }
    return filteredList;
  }

}

final allTaskProvider =
    StateNotifierProvider<AllTaskNotifier, AllTaskViewState>((ref) {
  return AllTaskNotifier();
});

//select item operation
class SelectNotifier extends StateNotifier<List<TaskModel>> {
  SelectNotifier() : super([]);

  final UserTaskRepo _userRepo = UserTaskRepo();

  void add(TaskModel task) {
    state = [...state, task];
  }

  void remove(String id) {
    state = state.where((element) => element.taskId != id).toList();
  }

  void deleteAll() {
    state = [];
  }

  Future<void> createTask(String userId, List<TaskModel> tasks) async {
    try {
      _userRepo.createTask(userId, tasks);
      state = [];
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    }
  }
}

final selectItemProvider =
    StateNotifierProvider<SelectNotifier, List<TaskModel>>((ref) {
  return SelectNotifier();
});
