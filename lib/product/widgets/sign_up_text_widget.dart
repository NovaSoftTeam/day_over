import 'package:flutter/material.dart';

class SignUpTextWidget extends StatelessWidget {
  final String signText;
  const SignUpTextWidget({super.key, required this.signText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          signText,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
