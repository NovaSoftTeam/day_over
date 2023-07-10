import 'package:day_over/features/task/all_task_view.dart';
import 'package:day_over/features/task/your_task_view.dart';
import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/widgets/custom_app_bar.dart';
import 'package:day_over/product/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskView extends ConsumerWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: const CustomDrawer(),
          body: Column(
            children: const [
              CustomAppBar(
                appBarText: "Görevler",
              ),
              TabBar(tabs: [
                Tab(
                    icon: Text(
                  "Tüm Görevler",
                  style: TextStyle(color: ColorConstants.purpleDark),
                )),
                Tab(
                    icon: Text(
                  "Görevlerin",
                  style: TextStyle(color: ColorConstants.purpleDark),
                ))
              ]),
              Expanded(
                child: TabBarView(children: [
                  AllTaskView(),
                  YourTaskView(),
                ]),
              )
            ],
          ),
        ));
  }
}
