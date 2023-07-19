import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class homeInform extends StatelessWidget {
  const homeInform({super.key, required this.data});
  final String data;


  @override
  Widget build(BuildContext context) {
    double textSize = 0;

    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      textSize = MediaQuery.of(context).size.height / 22;
    } else {
      textSize = MediaQuery.of(context).size.width / 25;
    }
    return Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 4,
        padding: EdgeInsets.all(20),
        child: Text(data, style: TextStyle(
          fontSize: textSize
        ) ),
        //margin: EdgeInsets.only(left: 15, bottom: 5, right: 15 ),
        alignment: Alignment(-1.0, 0.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromARGB(246, 246, 246, 246), width: 2),
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(246, 246, 246, 246),
           ));


  }
}
