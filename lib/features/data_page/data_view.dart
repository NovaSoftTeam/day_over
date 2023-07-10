import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/widgets/custom_app_bar.dart';
import 'package:day_over/product/widgets/custom_drawer.dart';
import 'package:day_over/product/widgets/custom_graphic.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DataView extends StatefulWidget {
  const DataView({Key? key}) : super(key: key);

  @override
  State<DataView> createState() => _DataViewState();
}

class _DataViewState extends State<DataView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _unselectedColor = ColorConstants.white;
  final _tabs = const <Widget>[
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
    double bMI = 0;
    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      bMI = MediaQuery.of(context).size.height / 9;
    } else {
      bMI = MediaQuery.of(context).size.width / 5;
    }
    final gradientColors = [
      ColorConstants.taskListItemFirstColor,
      ColorConstants.taskListItemLastColor
    ];

    var bmi = 24;
    String imagePath;
    if (bmi != null) {
      if (bmi <= 18.5) {
        imagePath = "assets/images/body_scale_1.png";
      } else if (bmi > 18.5 && bmi <= 24.9) {
        imagePath = "assets/images/body_scale_2.png";
      } else if (bmi > 25 && bmi <= 29.9) {
        imagePath = "assets/images/body_scale_3.png";
      } else if (bmi > 25 && bmi <= 29.9) {
        imagePath = "assets/images/body_scale_4.png";
      } else {
        imagePath = "assets/images/body_scale_5.png";
      }
    } else {
      imagePath = "assets/images/body_scale_6.png";
    }
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            const CustomAppBar(appBarText: "Veriler"),
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
                        colors: gradientColors,
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
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(ImagePathConstants.infoIcon),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    color: Colors.white,
                    child: const Text(StringConstants.earnCredit),
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
                    CustomGraphic(
                        datas: haftalikVeri, bottomTitle: _bottomTitlesDay),
                    CustomGraphic(
                        datas: aylikVeri, bottomTitle: _bottomTitlesMounth),
                    CustomGraphic(
                        datas: yillikVeri, bottomTitle: _bottomTitlesYear)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(ImagePathConstants.infoIcon),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    color: Colors.white,
                    child: const Text(StringConstants.bodyMassIndex),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage(imagePath),
                  width: bMI,
                ),
                Image(
                  image: const AssetImage(ImagePathConstants.weightScale),
                  width: bMI,
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
      interval: 1,
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
      interval: 1,
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
    interval: 1,
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

List<FlSpot> yillikVeri = const [
  FlSpot(2023, 2400),
  FlSpot(2022, 1850),
  FlSpot(2021, 1950),
  FlSpot(2020, 3200),
  FlSpot(2019, 1600),
];
List<FlSpot> haftalikVeri = const [
  FlSpot(1, 100),
  FlSpot(2, 250),
  FlSpot(3, 200),
  FlSpot(4, 350),
  FlSpot(5, 650),
  FlSpot(6, 300),
  FlSpot(7, 200),
];
List<FlSpot> aylikVeri = const [
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
