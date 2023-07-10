import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/services/user_services/task_services/base_user_task.dart';
import 'package:day_over/product/utility/firebase_custom_exception.dart';

class FirebaseTaskService implements BaseUserTask {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<TaskModel>> getAll() async {
    try {
      final taskDocuments = await firestore.collection("tasks").get();
      return fromFirebaseForQuerySnapshot(taskDocuments);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    }
  }

  List<TaskModel> fromFirebaseForQuerySnapshot(
      QuerySnapshot<Map<String, dynamic>> taskCollection) {
    List<TaskModel> tasks = [];
    for (var element in taskCollection.docs) {
      Map task = element.data();
      tasks.add(TaskModel(
          taskId: element.id,
          description: task["description"],
          credit: task["credit"]));
    }
    return tasks;
  }

  @override
  Future<List<TaskModel>> getYourTasks(String userId) async {
    try {
      DocumentSnapshot yourTasksDocSnaphost =
          await firestore.collection("your_tasks").doc(userId).get();

      final dynamic data = yourTasksDocSnaphost.data();
      final List<dynamic> taskDataList = data['tasks'] ?? [];

      List<TaskModel> taskList = taskDataList.map((taskData) {
        return TaskModel(
          taskId: taskData['id'],
          description: taskData['description'],
          credit: taskData['credit'],
        );
      }).toList();
      return taskList;
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    }
  }

  @override
  Future<void> createTask(String userId, List<TaskModel> taskList) async {
    CollectionReference tasks = firestore.collection("your_tasks");

    try {
      for (var task in taskList) {
        await tasks.doc(userId).set({
          'tasks': FieldValue.arrayUnion([
            {
              'id': task.taskId,
              'description': task.description,
              'credit': task.credit,
            },
          ]),
        }, SetOptions(merge: true));
      }
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    }
  }
}
