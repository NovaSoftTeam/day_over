import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_over/features/marketScreen/food_market.dart';
import 'package:day_over/features/marketScreen/sticker_market.dart';
import 'package:day_over/product/widgets/custom_app_bar.dart';
import 'package:day_over/product/widgets/custom_drawer.dart';
import 'package:day_over/product/widgets/custom_tab_bar.dart';
import 'package:day_over/product/widgets/magaza_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:day_over/product/constants/color_constants.dart';

class Market extends StatefulWidget {
  const Market({super.key});

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final gradientColors = [
    ColorConstants.taskListItemFirstColor,
    ColorConstants.taskListItemLastColor
  ];

  final _tabs = const <Widget>[
    Tab(
      text: 'Sticker',
    ),
    Tab(text: 'Gıda'),
  ];

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('stickers');

  @override
  Widget build(BuildContext context) {
    final gradientColors = [
      ColorConstants.taskListItemFirstColor,
      ColorConstants.taskListItemLastColor
    ];

    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            const CustomAppBar(appBarText: "Görevler"),
            const SizedBox(
              height: 10,
            ),
            CustomTabbarMenu(
                gradientColors: gradientColors,
                tabController: _tabController,
                tabs: _tabs),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 2,
                child: TabBarView(
                  controller: _tabController,
                  children: const [StickerMarket(), FoodMarket()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
