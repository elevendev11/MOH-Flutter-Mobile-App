import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sa_cooperation/screens/dashboard_screen.dart';
import 'package:sa_cooperation/screens/history_screen.dart';
import 'package:sa_cooperation/screens/profile_screen.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/style.dart';

import 'blog_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() async {
    if (_currentIndex == 0) {
      return true;
    } else {
      setState(() {
        _currentIndex = 0;
      });
    }
    return false;
  }

  final tab = const [
    DashboardScreen(),
    HistoryScreen(),
    BlogScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white60,
        body: tab[_currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Style.pColor,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          selectedLabelStyle: Style.bodyText2.copyWith(fontWeight: FontWeight.w500),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                homeIcon,
                height: 25,
                width: 25,
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                historyIcon,
                height: 25,
                width: 25,
              ),
              label: 'history',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                blogsIcon,
                height: 25,
                width: 25,
              ),
              label: 'blogs',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                historyIcon,
                height: 25,
                width: 25,
              ),
              label: 'profile',
            ),
          ],
          onTap: (index) {
            setState(
              () {
                _currentIndex = index;
                // if (_currentIndex == 2) _launchURL();
                //_splitScreen(index);
              },
            );
          },
        ),
      ),
    );
  }

  // void _splitScreen(int i) {
  //   switch (i) {
  //     case 0:
  //       const DashboardScreen();
  //       break;
  //     case 1:
  //       HistoryScreen();
  //       break;
  //     case 2:
  //       _launchURL();
  //       break;
  //   }
  // }

  // _launchURL() async {
  //   const url = "https://google.com";
  //   if (await canLaunchUrl(Uri.parse(url))) {
  //     await launchUrl(Uri.parse(url));
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
