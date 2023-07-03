import 'package:day_over/features/home/home_view.dart';
import 'package:day_over/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  void goToPage(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  final List _pages = const [
    HomeView(),
    SafeArea(
      child: Center(
        child: Icon(Icons.search),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: GNav(
              backgroundColor: Colors.black,
              activeColor: ColorConstants.white,
              color: Colors.white,
              duration: const Duration(milliseconds: 900),
              tabBackgroundColor: Colors.grey.shade600,
              gap: 10,
              onTabChange: (value) {
                goToPage(value);
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: "Likes",
                ),
                GButton(
                  icon: Icons.person,
                  text: "Profile",
                ),
                GButton(
                  icon: Icons.settings,
                  text: "Settings",
                )
              ]),
        ),
      ),
    );
  }
}
