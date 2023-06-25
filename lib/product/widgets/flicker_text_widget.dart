import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class FlickerTextWidget extends StatelessWidget {
  const FlickerTextWidget({super.key, required this.title, required this.textColor});

  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        FlickerAnimatedText(title, textStyle: context.textTheme.headlineSmall
                ?.copyWith(color: textColor, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
