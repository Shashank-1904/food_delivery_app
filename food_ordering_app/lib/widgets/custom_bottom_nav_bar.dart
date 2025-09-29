import 'package:flutter/material.dart';
import '../screens/restaurant_list_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/profile_screen.dart';


class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final bool replace; // new

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    this.replace = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      onTap: (index) {
        if (index == currentIndex) return;

        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const RestaurantListScreen()),
          );
        } else if (index == 1) {
          if (replace) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const CartScreen()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartScreen()),
            );
          }
        } else if (index == 2) {
          if (replace) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          }
        }
      },
    );
  }
}

