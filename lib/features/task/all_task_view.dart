import 'package:day_over/features/task/all_task_view_model.dart';
import 'package:day_over/product/widgets/task_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllTaskView extends ConsumerStatefulWidget {
  const AllTaskView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllTaskViewState();
}

class _AllTaskViewState extends ConsumerState<AllTaskView> {
  @override
  Widget build(BuildContext context) {
    //print("all task build calıstı");
    return FutureBuilder(
      future: ref.watch(allTaskProvider.notifier).getAll(),
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
