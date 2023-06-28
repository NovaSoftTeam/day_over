import 'package:day_over/features/home/home_view.dart';
import 'package:day_over/features/sign_up/sign_up_view.dart';
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

  List _pages = [HomeView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar:
          GNav(
            backgroundColor: Colors.black,
            activeColor: ColorConstants.white,
            color: Colors.white,
            onTabChange: (value) {
              goToPage(value);
            }, 
            tabs: const [
        GButton(
          icon: Icons.home,
          text: "Home",
        ),
        GButton(
          icon: Icons.search,
          text: "Search",
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
    );
  }
}
