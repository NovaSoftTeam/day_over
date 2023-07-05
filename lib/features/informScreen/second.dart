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
      backgroundColor: Color.fromARGB(255, 13, 99, 248),
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
                  image: AssetImage('assets/informScreenImages/SecondPng.png'),
                  alignment: Alignment.topLeft,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
                child: Text(
                    style: TextStyle(
                      fontSize: textSize,
                      color: Colors.white,
                      fontFamily: 'Poppins-Bold',
                    ),
                    'Hi, Welcome to'),
              ),
              Text(
                  style: TextStyle(
                    fontSize: textSize,
                    color: Colors.white,
                    fontFamily: 'Poppins-Bold',
                  ),
                  'Day Over!'),
              Container(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: textSize / 2,
                        color: Colors.white,
                        fontFamily: 'OpenSans-Light',
                      ),
                      "We build scalable intelligent mobile applications that simplify people's lives."),
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
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color.fromARGB(255, 171, 171, 172),
                    ),
                  ),
                  const SizedBox(
                    width: 3.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 25,
                    height: MediaQuery.of(context).size.height / 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
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
                      style: TextStyle(
                        fontSize: textSize / 2,
                        color: const Color.fromARGB(255, 121, 45, 184),
                        fontFamily: 'Poppins-Bold',
                      ),
                      'Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
