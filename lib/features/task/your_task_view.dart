import 'package:day_over/features/sign_up/sign_viev_model.dart';
import 'package:day_over/features/task/all_task_view_model.dart';
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
    return FutureBuilder(
      future: ref
          .watch(allTaskProvider.notifier)
          .getYourTasks(ref.watch(userUidProvider)),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TaskListItem(task: snapshot.data![index]),
              );
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
