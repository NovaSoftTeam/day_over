import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/widgets/custom_app_bar.dart';
import 'package:day_over/product/widgets/custom_drawer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';

class DataView extends StatefulWidget {
  const DataView({Key? key}) : super(key: key);

  @override
  State<DataView> createState() => _DataViewState();
}

class _DataViewState extends State<DataView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _unselectedColor = ColorConstants.white;
  final _tabs = <Widget>[
    Tab(
      text: 'Gün',
    ),
    Tab(text: 'Ay'),
    Tab(text: 'Yıl'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<double> earnedCoins = [100.0, 250.0, 100.0, 150.0, 200.0, 300.0, 250.0];

  @override
  Widget build(BuildContext context) {
    double textSize = 0;
    double containerWidth = 0;
    double containerHeight = 0;
    double BMI = 0;
    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      textSize = MediaQuery.of(context).size.height / 17;
      containerWidth = MediaQuery.of(context).size.width / 2;
      containerHeight = MediaQuery.of(context).size.height / 1.55;
      BMI = MediaQuery.of(context).size.height / 9;
    } else {
      textSize = MediaQuery.of(context).size.width / 17;
      containerWidth = MediaQuery.of(context).size.width;
      containerHeight = MediaQuery.of(context).size.height / 1.55;
      BMI = MediaQuery.of(context).size.width / 5;
    }
    final _gradientColors = [Color(0xFF5DE0E6), Color(0xFF004AAD)];
    var bmi = 24;
    var imagePath;
    if (bmi != null) {
      if (bmi <= 18.5) {
        imagePath = "assets/images/body scale 1.png";
      } else if (bmi > 18.5 && bmi <= 24.9) {
        imagePath = "assets/images/body scale 2.png";
      } else if (bmi > 25 && bmi <= 29.9) {
        imagePath = "assets/images/body scale 3.png";
      } else if (bmi > 25 && bmi <= 29.9) {
        imagePath = "assets/images/body scale 4.png";
      } else {
        imagePath = "assets/images/body scale 5.png";
      }
    } else {
      imagePath = "assets/images/body scale 6.png";
    }
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            CustomAppBar(appBarText: "Veriler", textSize: textSize / 1.25),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  height: kToolbarHeight,
                  width: MediaQuery.of(context).size.width / 1.5,
                  padding: const EdgeInsets.only(
                      top: 10.0, right: 16.0, left: 16.0, bottom: 10.0),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(223, 223, 223, 223),
                          spreadRadius: 5,
                          blurRadius: 4,
                          offset: Offset(4, 8),
                        )
                      ],
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height),
                      gradient: (LinearGradient(
                        colors: _gradientColors,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ))),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: Colors.white,
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: _unselectedColor,
                    tabs: _tabs,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Row(
                children: [
                  Image(
                    image: AssetImage("assets/images/icons8-info-50.png"),
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    color: Colors.white,
                    child: Text("Kazanılan Krediler"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 3,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: LineChart(LineChartData(
                              lineBarsData: [
                                LineChartBarData(
                                    spots: haftalikVeri
                                        .map((coin) => FlSpot(coin.x, coin.y))
                                        .toList(),
                                    isCurved: true,
                                    color: Colors.blue),
                              ],
                              borderData: FlBorderData(
                                  border: const Border(
                                      bottom: BorderSide(), left: BorderSide())),
                              gridData: FlGridData(show: false),
                              titlesData: FlTitlesData(
                                bottomTitles:
                                AxisTitles(sideTitles: _bottomTitlesDay),
                              ))),
                        )),

                    // second tab bar view widget
                    Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: LineChart(LineChartData(
                              lineBarsData: [
                                LineChartBarData(
                                    spots: aylikVeri
                                        .map((coin) => FlSpot(coin.x, coin.y))
                                        .toList(),
                                    isCurved: true,
                                    //dotData: FlDotData(show: false),
                                    color: Colors.blue),
                              ],
                              borderData: FlBorderData(
                                  border: const Border(
                                      bottom: BorderSide(), left: BorderSide())),
                              gridData: FlGridData(show: false),
                              titlesData: FlTitlesData(
                                bottomTitles:
                                AxisTitles(sideTitles: _bottomTitlesMounth),
                              ))),
                        )),
                    Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: LineChart(LineChartData(
                              lineBarsData: [
                                LineChartBarData(
                                    spots: yillikVeri
                                        .map((coin) => FlSpot(coin.x, coin.y))
                                        .toList(),
                                    isCurved: true,
                                    //dotData: FlDotData(show: false),
                                    color: Colors.blue),
                              ],
                              borderData: FlBorderData(
                                  border: const Border(
                                      bottom: BorderSide(), left: BorderSide())),
                              gridData: FlGridData(show: false),
                              titlesData: FlTitlesData(
                                bottomTitles:
                                AxisTitles(sideTitles: _bottomTitlesYear),
                              ))),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Row(
                children: [
                  Image(
                    image: AssetImage("assets/images/icons8-info-50.png"),
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    color: Colors.white,
                    child: Text("Vücut Kitle İndeksi"),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage(imagePath),
                  width: BMI,
                  //height: MediaQuery.of(context).size.width / 1.5,
                ),
                Image(
                  image:
                  AssetImage("assets/images/day over kilo çizelgesi.png"),
                  width: BMI,
                  //height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

SideTitles get _bottomTitlesMounth => SideTitles(
  showTitles: true,
  getTitlesWidget: (value, meta) {
    String text = '';
    switch (value.toInt()) {
      case 1:
        text = 'Jan';
        break;
      case 3:
        text = 'Mar';
        break;
      case 5:
        text = 'May';
        break;
      case 7:
        text = 'Jul';
        break;
      case 9:
        text = 'Sep';
        break;
      case 11:
        text = 'Nov';
        break;
    }

    return Text(text);
  },
);

SideTitles get _bottomTitlesDay => SideTitles(
  showTitles: true,
  getTitlesWidget: (value, meta) {
    String text = '';

    if (value.toInt() == 1) {
      text = 'Mon';
    } else if (value.toInt() == 2) {
      text = 'Tue';
    } else if (value.toInt() == 3) {
      text = 'Wed';
    } else if (value.toInt() == 4) {
      text = 'Thu';
    } else if (value.toInt() == 5) {
      text = 'Fri';
    } else if (value.toInt() == 6) {
      text = 'Sat';
    } else {
      text = 'Sun';
    }
    return Text(text);
  },
);

SideTitles get _bottomTitlesYear => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';

      if (value.toInt() == 2023) {
        text = '2023';
      } else if (value.toInt() == 2022) {
        text = '2022';
      } else if (value.toInt() == 2021) {
        text = '2021';
      } else if (value.toInt() == 2020) {
        text = '2020';
      } else if (value.toInt() == 2019) {
        text = '2019';
      }
      return Text(text);
    });

List<FlSpot> yillikVeri = [
  FlSpot(2023, 2400),
  FlSpot(2022, 1850),
  FlSpot(2021, 1950),
  FlSpot(2020, 3200),
  FlSpot(2019, 1600),
];
List<FlSpot> haftalikVeri = [
  FlSpot(1, 100),
  FlSpot(2, 250),
  FlSpot(3, 200),
  FlSpot(4, 350),
  FlSpot(5, 650),
  FlSpot(6, 300),
  FlSpot(7, 200),
];
List<FlSpot> aylikVeri = [
  FlSpot(1, 100),
  FlSpot(2, 250),
  FlSpot(3, 200),
  FlSpot(4, 350),
  FlSpot(5, 650),
  FlSpot(6, 300),
  FlSpot(7, 200),
  FlSpot(8, 200),
  FlSpot(9, 400),
  FlSpot(10, 300),
  FlSpot(11, 100),
  FlSpot(12, 150),
];
