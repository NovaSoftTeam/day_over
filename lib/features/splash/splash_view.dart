import 'package:day_over/features/splash/decision_splash_view.dart';
import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/widgets/wavy_text_widget.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DecisionSplashView()),
      );
    });

    return Scaffold(
      backgroundColor: ColorConstants.purpleDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
                padding: EdgeInsets.all(8.0),
                child: WavyTextWidget(
                  title: StringConstants.appName,
                  textColor: ColorConstants.white,
                )),
          ],
        ),
      ),
    );
  }
}
