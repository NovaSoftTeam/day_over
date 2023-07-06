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
          const ListTile(
            leading: Icon(Icons.home),
            title: Text('Ana Sayfa'),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
          ),
          const ListTile(
            leading: Icon(Icons.graphic_eq),
            title: Text('Veriler'),
          ),
          const ListTile(
            leading: Icon(Icons.store),
            title: Text('Mağaza'),
          ),
          const ListTile(
            leading: Icon(Icons.art_track),
            title: Text('Art Book'),
          ),
          const ListTile(
            leading: Icon(Icons.check),
            title: Text('Görevler'),
          ),
        ],
      ),
    );
  }
}
