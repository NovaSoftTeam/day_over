import 'package:day_over/features/sign_up/sign_viev_model.dart';
import 'package:day_over/features/task/your_task_view_model.dart';
import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/widgets/custom_circular_indicator.dart';
import 'package:day_over/product/widgets/custom_your_task_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YourTaskView extends ConsumerStatefulWidget {
  const YourTaskView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _YourTaskViewState();
}

class _YourTaskViewState extends ConsumerState<YourTaskView> {
  Future<List<TaskModel>> getYourTask() async {
    List<TaskModel> tasks = await ref
        .read(yourTaskProvider.notifier)
        .getYourTasks(ref.watch(userUidProvider));

    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ref.watch(yourTaskProvider) == YourTaskViewState.idle
            ? FutureBuilder(
                future: getYourTask(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomYourTaskListItem(
                                task: snapshot.data![index],
                                backgroundColor:
                                    ColorConstants.taskListItemLastColor));
                      },
                    );
                  } else {
                    return const CustomCircularIndicator();
                  }
                },
              )
            : const CustomCircularIndicator());
  }
}
