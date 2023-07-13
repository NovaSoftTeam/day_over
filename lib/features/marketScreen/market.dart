import 'package:day_over/product/widgets/custom_app_bar.dart';
import 'package:day_over/product/widgets/custom_drawer.dart';
import 'package:day_over/product/widgets/magaza_card.dart';
import 'package:flutter/material.dart';
import 'package:day_over/product/constants/color_constants.dart';

class Market extends StatefulWidget {
  const Market({super.key});

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _unselectedColor = ColorConstants.white;
  final _tabs = const <Widget>[
    Tab(
      text: 'Sticker',
    ),
    Tab(text: 'Gıda'),
  ];

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

  @override
  Widget build(BuildContext context) {
    final gradientColors = [
      ColorConstants.taskListItemFirstColor,
      ColorConstants.taskListItemLastColor
    ];
    List<CustomMagazaCard> cards = const [
      CustomMagazaCard(
        cardName: 'Abby Jhhony',
        cardAsset: 'assets/iconImages/sticker.png',
        cardPrice: '800',
      ),
      CustomMagazaCard(
        cardName: 'Abby Jhhony',
        cardAsset: 'assets/iconImages/sticker.png',
        cardPrice: '800',
      ),
      CustomMagazaCard(
        cardName: 'Abby Jhhony',
        cardAsset: 'assets/iconImages/sticker.png',
        cardPrice: '800',
      ),
      CustomMagazaCard(
        cardName: 'Abby Jhhony',
        cardAsset: 'assets/iconImages/sticker.png',
        cardPrice: '800',
      ),
      CustomMagazaCard(
        cardName: 'Abby Jhhony',
        cardAsset: 'assets/iconImages/sticker.png',
        cardPrice: '800',
      ),
      CustomMagazaCard(
        cardName: 'Abby Jhhony',
        cardAsset: 'assets/iconImages/sticker.png',
        cardPrice: '800',
      ),
    ];
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(appBarText: "Market"),
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
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount:
                      MediaQuery.of(context).size.width ~/ 150,
                ),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                itemCount: cards.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: cards[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
