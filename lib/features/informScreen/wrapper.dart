import 'package:day_over/features/informScreen/first.dart';
import 'package:day_over/features/informScreen/second.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 0,
    );
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: [
          WelcomeOne(),
          WelcomeTwo(),
        ],
      ),
    );
  }
}
