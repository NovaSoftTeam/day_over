import 'package:day_over/features/task/all_task_view_model.dart';
import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:day_over/product/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskListItem extends ConsumerStatefulWidget {
  final TaskModel task;
  const TaskListItem({super.key, required this.task});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskListItemState();
}

class _TaskListItemState extends ConsumerState<TaskListItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorConstants.taskListItemFirstColor,
              ColorConstants.taskListItemLastColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: ListTile(
        leading: Checkbox(
          value: isSelected,
          onChanged: (value) {
            setState(() {
              isSelected = !isSelected;
            });
            if (value!) {
              ref.read(allTaskProvider.notifier).add(widget.task);
            }
            if (value == false) {
              ref.read(allTaskProvider.notifier).remove(widget.task.taskId);
            }
          },
        ),
        trailing: Image.asset(ImagePathConstants.coinImage, height: 20),
        onTap: () {
          //print("${widget.task.description} tıklandı");
        },
        title: Text(widget.task.description),
        subtitle: Text("${widget.task.credit}"),
      ),
    );
  }
}
