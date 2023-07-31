import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:day_over/features/sign_up/sign_viev_model.dart';
import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:day_over/product/constants/text_fonts_constants.dart';
import 'package:day_over/product/services/user_services/update_services/update_user_sevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomMagazaCard extends ConsumerStatefulWidget {
  const CustomMagazaCard(
      {super.key,
      required this.cardName,
      required this.cardAsset,
      required this.cardPrice});
  final String cardName;
  final String cardAsset;
  final String cardPrice;

  @override
  ConsumerState<CustomMagazaCard> createState() => _CustomMagazaCardState();
}

class _CustomMagazaCardState extends ConsumerState<CustomMagazaCard> {
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
    return Container(
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
              widget.cardName),
          const SizedBox(
            height: 5,
          ),
          FractionallySizedBox(
            widthFactor: 0.6,
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage(widget.cardAsset),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 245, 245, 245),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: textSize / 2.3,
                        backgroundImage:
                            const AssetImage(ImagePathConstants.coinImage),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                          style: TextStyle(
                            fontFamily: TextFontsConstants.poppinsBold,
                            fontSize: textSize / 2.5,
                          ),
                          widget.cardPrice),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      keyboardAware: true,
                      dismissOnBackKeyPress: false,
                      dialogType: DialogType.INFO_REVERSED,
                      animType: AnimType.BOTTOMSLIDE,
                      btnCancelText: "İptal",
                      btnOkText: "Satın al",
                      title: "Satın almak istiyor musunuz?",
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        DatabaseService(
                          uid: ref.watch(userUidProvider),
                        ).updateCreditDataRemove(
                            int.parse(widget.cardPrice), context);
                      },
                    ).show();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 245, 245, 245),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: textSize / 2.3,
                            backgroundImage: const AssetImage(
                              ImagePathConstants.buyIcon,
                            )),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                            style: TextStyle(
                              fontFamily: TextFontsConstants.poppinsBold,
                              fontSize: textSize / 2.5,
                            ),
                            'Satın Al'),
                        const SizedBox(
                          width: 7,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
