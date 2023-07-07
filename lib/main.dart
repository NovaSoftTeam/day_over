import 'package:day_over/features/profileScreen/edit.dart';
import 'package:day_over/features/profileScreen/profile.dart';
import 'package:day_over/features/sign_up/sign_up_view.dart';
import 'package:day_over/features/splash/splash_view.dart';
import 'package:day_over/features/task/task_view.dart';
import 'package:day_over/product/initialize/app_start.dart';
import 'package:day_over/product/widgets/task_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const TaskView(),
      home: const Profile(),
    );
  }
}
