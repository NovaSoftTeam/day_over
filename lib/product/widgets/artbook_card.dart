import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:day_over/product/constants/text_fonts_constants.dart';
import 'package:flutter/material.dart';

class ArtBookCard extends StatelessWidget {
  const ArtBookCard({
    super.key,
    required this.cardName,
    required this.cardAsset,
  });
  final String cardName;
  final String cardAsset;
  static bool visible = true;
  setVisibility(bool visibility) {
    visible = visibility;
  }

  @override
  Widget build(BuildContext context) {
    double textSize = 0;
    if (MediaQuery.of(context).size.width < 300) {
      textSize = MediaQuery.of(context).size.width / 10;
    } else if (MediaQuery.of(context).size.width < 450 &&
        MediaQuery.of(context).size.width >= 300) {
      textSize = MediaQuery.of(context).size.width / 18;
    } else if (MediaQuery.of(context).size.width < 600 &&
        MediaQuery.of(context).size.width >= 450) {
      textSize = MediaQuery.of(context).size.width / 28;
    } else if (MediaQuery.of(context).size.width < 750 &&
        MediaQuery.of(context).size.width >= 600) {
      textSize = MediaQuery.of(context).size.width / 36;
    } else if (MediaQuery.of(context).size.width < 900 &&
        MediaQuery.of(context).size.width >= 750) {
      textSize = MediaQuery.of(context).size.width / 45;
    } else if (MediaQuery.of(context).size.width < 1050 &&
        MediaQuery.of(context).size.width >= 900) {
      textSize = MediaQuery.of(context).size.width / 52;
    } else if (MediaQuery.of(context).size.width < 1200 &&
        MediaQuery.of(context).size.width >= 1050) {
      textSize = MediaQuery.of(context).size.width / 62;
    } else if (MediaQuery.of(context).size.width < 1350 &&
        MediaQuery.of(context).size.width >= 1200) {
      textSize = MediaQuery.of(context).size.width / 71;
    } else if (MediaQuery.of(context).size.width < 1500 &&
        MediaQuery.of(context).size.width >= 1350) {
      textSize = MediaQuery.of(context).size.width / 80;
    } else if (MediaQuery.of(context).size.width < 1650 &&
        MediaQuery.of(context).size.width >= 1500) {
      textSize = MediaQuery.of(context).size.width / 90;
    } else if (MediaQuery.of(context).size.width < 1800 &&
        MediaQuery.of(context).size.width >= 1650) {
      textSize = MediaQuery.of(context).size.width / 100;
    } else if (MediaQuery.of(context).size.width <= 1920 &&
        MediaQuery.of(context).size.width >= 1800) {
      textSize = MediaQuery.of(context).size.width / 110;
    } else {
      textSize = MediaQuery.of(context).size.width / 200;
    }
    return Visibility(
      visible: visible,
      child: Container(
        color: const Color.fromARGB(255, 228, 223, 223),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
                style: TextStyle(
                  fontFamily: TextFontsConstants.poppinsBold,
                  fontSize: textSize / 2.3,
                ),
                cardName),
            const SizedBox(
              height: 5,
            ),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(cardAsset),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
