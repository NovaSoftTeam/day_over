class TaskModel {
  final String taskId;
  final String description;
  final int credit;
  final bool isSelected;

  TaskModel(
      {required this.taskId,
      required this.description,
      required this.credit,
      this.isSelected = false});
}
