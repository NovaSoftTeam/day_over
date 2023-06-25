import 'package:day_over/features/sign_up/sign_up_view.dart';
import 'package:day_over/features/splash/splash_view.dart';
import 'package:day_over/product/initialize/app_start.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpView(),
    );
  }
}


