import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:flutter/material.dart';

class WelcomeTwo extends StatelessWidget {
  const WelcomeTwo({super.key});

  @override
  Widget build(BuildContext context) {
    double textSize = 0;
    double containerWidth = 0;
    double containerHeight = 0;
    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      textSize = MediaQuery.of(context).size.height / 17;
      containerWidth = MediaQuery.of(context).size.width / 2;
      containerHeight = MediaQuery.of(context).size.height / 1.55;
    } else {
      textSize = MediaQuery.of(context).size.width / 17;
      containerWidth = MediaQuery.of(context).size.width;
      containerHeight = MediaQuery.of(context).size.height / 1.55;
    }
    return Scaffold(
      backgroundColor: ColorConstants.informationScreenColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: containerWidth,
                height: containerHeight,
                child: const Image(
                  fit: BoxFit.fill,
                  image: AssetImage(ImagePathConstants.informationSecondScreenImage),
                  alignment: Alignment.topLeft,
                ),
              ),
              Container(
                padding:const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
                child: Text(
                  StringConstants.informationScreenHiText,
                    style: TextStyle(
                      fontSize: textSize,
                      color: Colors.white,
                      fontFamily: 'Poppins-Bold',
                    ),),
              ),
              Text(
                StringConstants.informationScreenDayOver,
                  style: TextStyle(
                    fontSize: textSize,
                    color: Colors.white,
                    fontFamily: 'Poppins-Bold',
                  ),),
              Container(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    StringConstants.informationFirstText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: textSize / 2,
                        color: Colors.white,
                        fontFamily: 'OpenSans-Light',
                      ),),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 25,
                    height: MediaQuery.of(context).size.height / 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: ColorConstants.informationScreenBoxColor,
                    ),
                  ),
                  const SizedBox(
                    width: 3.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 25,
                    height: MediaQuery.of(context).size.height / 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: ColorConstants.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onPressed: () {},
                  child: Text(
                    StringConstants.informationSecondPageButtonText,
                      style: TextStyle(
                        fontSize: textSize / 2,
                        color: const Color.fromARGB(255, 121, 45, 184),
                        fontFamily: 'Poppins-Bold',
                      ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
