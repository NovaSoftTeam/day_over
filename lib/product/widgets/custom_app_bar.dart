import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  final String appBarText;
  final double textSize;
  const CustomAppBar({
    super.key,
    required this.appBarText,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        appBarText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'GlacialIndifference-Regular',
          color: Colors.black,
          fontSize: textSize,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
          child: ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.white,
              ),
              elevation: MaterialStateProperty.all(0.0),
            ),
            onPressed: () {},
            icon: Image.asset(ImagePathConstants.coinImage),
            label: const Text(
              '450',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
