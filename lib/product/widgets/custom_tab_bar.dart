import 'package:day_over/product/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomTabbarMenu extends StatelessWidget {
  final List<Color> gradientColors;
  final TabController tabController;
  final List<Widget> tabs;

  const CustomTabbarMenu(
      {super.key,
      required this.gradientColors,
      required this.tabController,
      required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      width: MediaQuery.of(context).size.width / 1.2,
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
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.height),
          gradient: (LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ))),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            25.0,
          ),
          color: ColorConstants.white,
        ),
        labelColor: Colors.black,
        unselectedLabelColor: ColorConstants.white,
        tabs: tabs,
      ),
    );
  }
}
