import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class CustomMagazaCard extends StatelessWidget {
  const CustomMagazaCard(
      {super.key,
      required this.cardName,
      required this.cardAsset,
      required this.cardPrice});
  final String cardName;
  final String cardAsset;
  final String cardPrice;

  @override
  Widget build(BuildContext context) {
    double textSize = 0;
    if (MediaQuery.of(context).size.width < 300) {
      textSize = MediaQuery.of(context).size.width / 8;
    } else if (MediaQuery.of(context).size.width < 450 &&
        MediaQuery.of(context).size.width >= 300) {
      textSize = MediaQuery.of(context).size.width / 17;
    } else if (MediaQuery.of(context).size.width < 600 &&
        MediaQuery.of(context).size.width >= 450) {
      textSize = MediaQuery.of(context).size.width / 26;
    } else if (MediaQuery.of(context).size.width < 750 &&
        MediaQuery.of(context).size.width >= 600) {
      textSize = MediaQuery.of(context).size.width / 34;
    } else if (MediaQuery.of(context).size.width < 900 &&
        MediaQuery.of(context).size.width >= 750) {
      textSize = MediaQuery.of(context).size.width / 43;
    } else if (MediaQuery.of(context).size.width < 1050 &&
        MediaQuery.of(context).size.width >= 900) {
      textSize = MediaQuery.of(context).size.width / 51;
    } else if (MediaQuery.of(context).size.width < 1200 &&
        MediaQuery.of(context).size.width >= 1050) {
      textSize = MediaQuery.of(context).size.width / 61;
    } else if (MediaQuery.of(context).size.width < 1350 &&
        MediaQuery.of(context).size.width >= 1200) {
      textSize = MediaQuery.of(context).size.width / 70;
    } else if (MediaQuery.of(context).size.width < 1500 &&
        MediaQuery.of(context).size.width >= 1350) {
      textSize = MediaQuery.of(context).size.width / 79;
    } else if (MediaQuery.of(context).size.width < 1650 &&
        MediaQuery.of(context).size.width >= 1500) {
      textSize = MediaQuery.of(context).size.width / 89;
    } else if (MediaQuery.of(context).size.width < 1800 &&
        MediaQuery.of(context).size.width >= 1650) {
      textSize = MediaQuery.of(context).size.width / 99;
    } else if (MediaQuery.of(context).size.width <= 1920 &&
        MediaQuery.of(context).size.width >= 1800) {
      textSize = MediaQuery.of(context).size.width / 109;
    }
    return Container(
      color: Color.fromARGB(255, 228, 223, 223),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: textSize / 2.3,
              ),
              cardName),
          const SizedBox(
            height: 5,
          ),
          FractionallySizedBox(
            widthFactor: 0.6,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage(cardAsset),
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
                            AssetImage('assets/informScreenImages/coin.png'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                          style: TextStyle(
                            fontFamily: 'Poppins-Bold',
                            fontSize: textSize / 2.5,
                          ),
                          cardPrice),
                      SizedBox(
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
                      desc: "Stickerlar sınırlı sayıdadır!",
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        print("Satın aldın");
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
                            backgroundImage: AssetImage(
                              'assets/iconImages/buy.png',
                            )),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                            style: TextStyle(
                              fontFamily: 'Poppins-Bold',
                              fontSize: textSize / 2.5,
                            ),
                            'Satın Al'),
                        SizedBox(
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
