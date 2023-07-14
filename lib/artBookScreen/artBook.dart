import 'package:day_over/product/widgets/artbook_card.dart';
import 'package:day_over/product/widgets/custom_app_bar.dart';
import 'package:day_over/product/widgets/custom_app_bar_search.dart';
import 'package:day_over/product/widgets/custom_drawer.dart';
import 'package:day_over/product/widgets/magaza_card.dart';
import 'package:flutter/material.dart';
import 'package:day_over/product/constants/color_constants.dart';

class ArtBook extends StatefulWidget {
  const ArtBook({super.key});

  @override
  State<ArtBook> createState() => _ArtBookState();
}

class _ArtBookState extends State<ArtBook> with SingleTickerProviderStateMixin {
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
    List<ArtBookCard> cards = const [
      ArtBookCard(
        cardName: 'Abby Jhhony',
        cardAsset: 'assets/iconImages/sticker.png',
      ),
      ArtBookCard(
        cardName: 'Abby Jhhony',
        cardAsset: 'assets/iconImages/sticker.png',
      ),
      ArtBookCard(
        cardName: 'Abby Jhhony',
        cardAsset: 'assets/iconImages/sticker.png',
      ),
      ArtBookCard(
        cardName: 'Abby Jhhony',
        cardAsset: 'assets/iconImages/sticker.png',
      ),
      ArtBookCard(
        cardName: 'Abby Jhhony',
        cardAsset: 'assets/iconImages/sticker.png',
      ),
      ArtBookCard(
        cardName: 'Abby Jhhony',
        cardAsset: 'assets/iconImages/sticker.png',
      ),
    ];
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBarSearch(appBarText: "Art Book"),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: MediaQuery.of(context).size.width ~/ 150,
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
