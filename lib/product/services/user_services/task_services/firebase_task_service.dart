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
      return fromFirebase(taskDocuments);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    }
  }

  List<TaskModel> fromFirebase(
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
}
