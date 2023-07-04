import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:flutter/material.dart';

class SignUpAppBarWidget extends StatelessWidget {
  const SignUpAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: FractionallySizedBox(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Image.asset(
            ImagePathConstants.signUpAppImage,
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
