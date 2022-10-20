import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/utilities/app_strings.dart';
import 'package:task/views/screens/home_tab.dart';

import '../../bloc/expert_bloc.dart';
import '../../utilities/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomNavBarSelectedIndex = 0;

  static List<Widget> bottomNavBarWidgets = <Widget>[
    BlocProvider(create: (context) => ExpertBloc(), child: const Home()),
    const Text(
      'Index 2: Favourites',
    ),
    const Text(
      'Index 3: Wallet',
    ),
    const Text(
      'Index 4: Profile',
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      bottomNavBarSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: bottomNavBarWidgets.elementAt(bottomNavBarSelectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: white,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(fontSize: 10.0),
            unselectedFontSize: 10.0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  home,
                  scale: 3,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  star,
                  scale: 3,
                ),
                label: 'Favourites',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  wallet,
                  scale: 3,
                ),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  profile,
                  scale: 3,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: bottomNavBarSelectedIndex,
            selectedItemColor: mainColor,
            onTap: onItemTapped,
          ),
        ),
      ),
    );
  }
}
