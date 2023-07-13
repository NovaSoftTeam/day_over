import 'package:day_over/features/data_page/data_view.dart';
import 'package:day_over/features/marketScreen/market.dart';
import 'package:day_over/features/profileScreen/profile.dart';
import 'package:day_over/features/task/task_view.dart';
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
                image: AssetImage('assets/informScreenImages/image.png'),
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
            title: const Text('Ana Sayfa'),
            onTap: () {
              //routing
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profil'),
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
            title: const Text('Veriler'),
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
            title: const Text('Mağaza'),
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
            title: const Text('Art Book'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.check),
            title: const Text('Görevler'),
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
