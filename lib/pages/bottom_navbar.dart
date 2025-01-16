import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/favorite_itempage.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/AccountPage.dart';
import 'package:food_delivery/pages/navbar.dart';

class BottomNavPage extends StatefulWidget {
  BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int selectedIndex = 0;

  List<Widget> optionPages = [
    MyHomePage(),
    FoodItemPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: optionPages[selectedIndex]),
      appBar: Platform.isAndroid
          ? AppBar(
              centerTitle: true,
              actions: [],
              title: const Center(child: Text('Foody')),
            )
          : Platform.isIOS
              ? PreferredSize(
                  preferredSize: Size.fromHeight(44.0),
                  child: CupertinoNavigationBar(
                    middle: Text('Foody'),
                    backgroundColor: Colors.grey[100],
                  ),
                )
              : null,
      drawer: NavBar(),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        color: Colors.white,
        backgroundColor: Colors.deepOrange,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          _buildNavItem(Icons.home, 'Home', 0),
          _buildNavItem(Icons.favorite, 'Favorite', 1),
          _buildNavItem(Icons.person, 'Person', 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 8.0,
          ),
          Icon(
            icon,
            size: 27,
            color: isSelected ? Colors.deepOrange : Colors.grey[700],
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
          ),
        ],
      ),
    );
  }
}
