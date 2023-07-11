import 'package:day_over/features/sign_up/sign_viev_model.dart';
import 'package:day_over/features/task/all_task_view_model.dart';
import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/widgets/custom_circular_indicator.dart';
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
    print("build tetiklendi");
    return Scaffold(
      body: FutureBuilder(
        future: ref
            .watch(allTaskProvider.notifier)
            .filteredList(ref.watch(userUidProvider)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TaskListItem(
                      task: snapshot.data![index],
                      backgroundColor: ColorConstants.taskListItemFirstColor),
                );
              },
            );
          } else {
            return const CustomCircularIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () {
            var selectedTaskList = ref.watch(allTaskProvider);
            ref
                .read(allTaskProvider.notifier)
                .createTask(ref.watch(userUidProvider), selectedTaskList);
          }),
    );
  }
}
