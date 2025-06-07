import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return BottomNavigationBar(
      selectedItemColor:
          isDarkMode ? const Color(0xFFFFAB91) : const Color(0xFF4E342E),
      unselectedItemColor: Colors.grey,
      backgroundColor:
          isDarkMode ? const Color(0xFF6D4C41) : const Color(0xFFD7CCC8),
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) {
        // You can add navigation logic here if needed
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_cafe),
          label: 'Products',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment'),
      ],
    );
  }
}
