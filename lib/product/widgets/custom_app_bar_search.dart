import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/widgets/artbook_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBarSearch extends ConsumerWidget {
  final String appBarText;
  final Color? backgroundColor;
  const CustomAppBarSearch(
      {super.key,
      required this.appBarText,
      this.backgroundColor = ColorConstants.white});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Icon customIcon = const Icon(Icons.search);
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: Text(
        appBarText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'GlacialIndifference-Regular',
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
          child: IconButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.white,
              ),
              elevation: MaterialStateProperty.all(0.0),
            ),
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            icon: customIcon,
          ),
        ),
      ],
    );
  }
}

class MySearchDelegate extends SearchDelegate<String> {
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
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: MediaQuery.of(context).size.width ~/ 150,
      ),
      controller: ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int index) {
        if (!cards[index].cardName.contains(query)) {
          cards[index].setVisibility(false);
        } else {
          cards[index].setVisibility(true);
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: cards[index],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ArtBookCard> suggestions = cards.where((element) {
      return element.cardName.contains(query);
    }).toList();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: MediaQuery.of(context).size.width ~/ 150,
      ),
      controller: ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: suggestions[index],
        );
      },
    );
  }
}
