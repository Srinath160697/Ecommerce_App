import 'package:flutter/material.dart';
import 'package:frontend_ecommerce_app/view/screens/bottom_nav_screens/account_screen.dart';
import 'package:frontend_ecommerce_app/view/screens/bottom_nav_screens/cart_screen.dart';
import 'package:frontend_ecommerce_app/view/screens/bottom_nav_screens/favourite_screen.dart';
import 'package:frontend_ecommerce_app/view/screens/bottom_nav_screens/home_screen.dart';
import 'package:frontend_ecommerce_app/view/screens/bottom_nav_screens/store_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> page = [
    HomeScreen(),
    CartScreen(),
    StoreScreen(),
    AccountScreen(),
    FavouriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF6200EE),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Store'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Account'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
      ),
      body: page[_selectedIndex],
    );
  }
}
