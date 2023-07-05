import 'package:day_over/product/constants/color_constants.dart';
import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {

  final String description;
  final int credit;
  const TaskListItem({super.key, required this.description, required this.credit});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorConstants.taskListItemFirstColor,
              ColorConstants.taskListItemLastColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        child: ListTile(
          leading: Checkbox(value: true, onChanged: (value) {
            
          },)
          ,trailing: Icon(Icons.money),
          onTap: () {
            print("$description tıklandı");
          },
          title: Text(description),
          subtitle: Text("$credit"),
        ),
      ),
    );
  }
}
