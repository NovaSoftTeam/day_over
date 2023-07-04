import 'package:day_over/product/constants/string_constants.dart';
import 'package:flutter/material.dart';

class SignUpTextWidget extends StatelessWidget {
  const SignUpTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            StringConstants.signUpText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
