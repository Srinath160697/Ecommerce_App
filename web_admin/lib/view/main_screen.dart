import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:web_admin/view/sidebar_screen/buyers_screen.dart';
import 'package:web_admin/view/sidebar_screen/categories_screen.dart';
import 'package:web_admin/view/sidebar_screen/orders_screen.dart';
import 'package:web_admin/view/sidebar_screen/products_screen.dart';
import 'package:web_admin/view/sidebar_screen/upload_banner_screen.dart';
import 'package:web_admin/view/sidebar_screen/vendor_screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedScreen = VendorScreens();
  void selectscreens(items) {
    switch (items.route) {
      case VendorScreens.id:
        setState(() {
          _selectedScreen = VendorScreens();
        });
        break;
      case BuyersScreen.id:
        setState(() {
          _selectedScreen = BuyersScreen();
        });
        break;
      case OrdersScreen.id:
        setState(() {
          _selectedScreen = OrdersScreen();
        });
        break;
      case CategoriesScreen.id:
        setState(() {
          _selectedScreen = CategoriesScreen();
        });
        break;
      case UploadBannerScreen.id:
        setState(() {
          _selectedScreen = UploadBannerScreen();
        });
        break;
      case ProductsScreen.id:
        setState(() {
          _selectedScreen = ProductsScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        title: const Text('Management Dashboard'),
        backgroundColor: Colors.blue,
      ),
      body: _selectedScreen,
      sideBar: SideBar(
        header: Container(
          height: 100,
          color: Colors.black,
          child: const Center(
            child: Text(
              'Management Dashboard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        items: [
          AdminMenuItem(
            title: 'Vendor',
            route: VendorScreens.id,
            icon: Icons.person,
          ),
          AdminMenuItem(
            title: 'Buyers',
            route: BuyersScreen.id,
            icon: Icons.person,
          ),
          AdminMenuItem(
            title: 'Orders',
            route: OrdersScreen.id,
            icon: Icons.person,
          ),
          AdminMenuItem(
            title: 'Categories',
            route: CategoriesScreen.id,
            icon: Icons.person,
          ),
          AdminMenuItem(
            title: 'Upload Banners',
            route: UploadBannerScreen.id,
            icon: Icons.person,
          ),
          AdminMenuItem(
            title: 'Products',
            route: ProductsScreen.id,
            icon: Icons.person,
          ),
        ],
        selectedRoute: VendorScreens.id,
        onSelected: (item) {
          selectscreens(item);
        },
      ),
    );
  }
}
