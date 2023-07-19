import 'package:day_over/features/task/all_task_view.dart';
import 'package:day_over/features/task/your_task_view.dart';
import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/widgets/custom_app_bar.dart';
import 'package:day_over/product/widgets/custom_drawer.dart';
import 'package:day_over/product/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskView extends ConsumerStatefulWidget {
  const TaskView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskView();
}

class _TaskView extends ConsumerState<TaskView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final gradientColors = [
    ColorConstants.taskListItemFirstColor,
    ColorConstants.taskListItemLastColor
  ];

  final _tabs = const <Widget>[
    Tab(
      text: 'Tüm Görevler',
    ),
    Tab(text: 'Senin Görevlerin'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          const CustomAppBar(appBarText: "Görevler"),
          const SizedBox(
            height: 10,
          ),
          CustomTabbarMenu(
              gradientColors: gradientColors,
              tabController: _tabController,
              tabs: _tabs),
          Expanded(
            child: AspectRatio(
              aspectRatio: 2,
              child: TabBarView(
                controller: _tabController,
                children: const [AllTaskView(), YourTaskView()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
