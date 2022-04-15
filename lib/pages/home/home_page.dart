import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/pages.dart';
import 'package:food_delivery_app/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = const [
    MainFoodPage(),
    SizedBox(
      child: Center(
        child: Text('Next page'),
      ),
    ),
    SizedBox(
      child: Center(
        child: Text('Next next page'),
      ),
    ),
    SizedBox(
      child: Center(
        child: Text('Next next next page'),
      ),
    ),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: (index) => onTapNav(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'history',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'person',
          ),
        ],
      ),
    );
  }
}
