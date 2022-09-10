import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:monews/constants/constants.dart';
import 'package:monews/screen/explore_screen.dart';
import 'package:monews/screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedItemNavigation = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        backgroundColor: back_color,
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int index) {
              setState(() {
                _selectedItemNavigation = index;
              });
            },
            currentIndex: _selectedItemNavigation,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/home.png',
                  width: 30,
                  height: 30,
                ),
                activeIcon: Image.asset(
                  'assets/images/home_active.png',
                  width: 30,
                  height: 30,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/discover.png',
                  width: 30,
                  height: 30,
                ),
                activeIcon: Image.asset(
                  'assets/images/discover_active.png',
                  width: 30,
                  height: 30,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/add_circle.png',
                  width: 30,
                  height: 30,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/save_2.png',
                  width: 30,
                  height: 30,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/profile.png',
                  width: 30,
                  height: 30,
                ),
                label: "",
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Expanded(
              child: IndexedStack(
                index: _selectedItemNavigation,
                children: _getLayoutPage(),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Container(
                color: main_red,
                width: double.infinity,
                height: 48,
                child: Marquee(
                  text:
                      'برانکو تکذیب کرد/ نه با عمان فسخ کردم، نه با ایران مذاکره داشتم   ...',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SB',
                    fontSize: 16,
                  ),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  blankSpace: 20.0,
                  velocity: 100.0,
                  pauseAfterRound: Duration(seconds: 1),
                  startPadding: 10.0,
                  accelerationDuration: Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getLayoutPage() => [
        HomeScreen(),
        ExploreScreen(),
        Container(color: Colors.red),
        Container(color: Colors.amber),
        Container(color: Colors.blue),
      ];
}
