import 'package:day_over/features/task/all_task_view_model.dart';
import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/widgets/task_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YourTaskView extends ConsumerStatefulWidget {
  const YourTaskView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _YourTaskViewState();
}

class _YourTaskViewState extends ConsumerState<YourTaskView> {
  @override
  Widget build(BuildContext context) {
    //print("your task build calıstı");

    List<TaskModel> tasks = ref.watch(allTaskProvider);

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Dismissible(
            onDismissed: (direction) {
              ref.read(allTaskProvider.notifier).remove(tasks[index].taskId);
            },
            key: ValueKey(tasks[index].taskId),
            child: TaskListItem(task: tasks[index])),
        );
      },
    );
  }
}
