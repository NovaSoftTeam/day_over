import 'package:day_over/features/sign_up/sign_viev_model.dart';
import 'package:day_over/features/task/your_task_view_model.dart';
import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:day_over/product/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomYourTaskListItem extends ConsumerStatefulWidget {
  final TaskModel task;
  final Color backgroundColor;
  const CustomYourTaskListItem({
    super.key,
    required this.task,
    required this.backgroundColor,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomYourTaskListItem();
}

class _CustomYourTaskListItem extends ConsumerState<CustomYourTaskListItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      child: ListTile(
        leading: Container(child: Image.asset(ImagePathConstants.coinImage)),
        trailing: IconButton(
            onPressed: () {
              ref
                  .read(yourTaskProvider.notifier)
                  .deleteTask(ref.watch(userUidProvider), widget.task);
            },
            icon: const Icon(
              Icons.delete,
              color: ColorConstants.white,
            )),
        onTap: () {
          //print("${widget.task.description} tıklandı");
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
              style: const TextStyle(color: ColorConstants.white),
            ),
          ],
        ),
      ),
    );
  }
}
