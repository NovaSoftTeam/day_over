import 'package:day_over/features/art_book/art_book_view.dart';
import 'package:day_over/features/data_page/data_view.dart';
import 'package:day_over/features/marketScreen/market.dart';
import 'package:day_over/features/profile/profile.dart';
import 'package:day_over/features/task/task_view.dart';
import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePathConstants.dayOverDrawerImage),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Container(),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(StringConstants.mainPage),
            onTap: () {
              //routing
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(StringConstants.profilePage),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const Profile();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.graphic_eq),
            title: const Text(StringConstants.dataPage),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const DataView();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text(StringConstants.shopPage),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const Market();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.art_track),
            title: const Text(StringConstants.artBookPage),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const ArtBookView();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.check),
            title: const Text(StringConstants.taskPage),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const TaskView();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
