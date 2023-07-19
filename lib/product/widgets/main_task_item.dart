import 'package:day_over/features/task/task_view.dart';
import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:day_over/product/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainTaskItem extends ConsumerStatefulWidget {
  final TaskModel task;
  final Color? backgroundColor;
  const MainTaskItem({
    super.key,
    this.backgroundColor = Colors.blue,
    required this.task,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainTaskItem();
}

class _MainTaskItem extends ConsumerState<MainTaskItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const TaskView();
          },));
        },
        title: Text(
          widget.task.description,
          style: const TextStyle(color: ColorConstants.white),
        ),
        subtitle: Row(
          children: [
            Image.asset(
              ImagePathConstants.coinImage,
              width: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "${widget.task.credit}",
              style:
                  const TextStyle(color: ColorConstants.white),
            ),
          ],
        ),
      ),
    );
  }
}
