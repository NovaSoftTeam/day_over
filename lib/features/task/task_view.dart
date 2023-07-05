import 'package:day_over/product/repository/user_repo.dart';
import 'package:day_over/product/widgets/task_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskView extends ConsumerWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserRepo _repo = UserRepo();

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: _repo.getAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TaskListItem(
                          description: snapshot.data![index].description,
                          credit: snapshot.data![index].credit),
                    );
                  },
                );
              }else{
                return const CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
