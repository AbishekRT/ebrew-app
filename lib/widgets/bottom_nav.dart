import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,

      // Colors based on dark/light theme
      selectedItemColor:
          isDarkMode ? const Color(0xFFFFAB91) : const Color(0xFF4E342E),
      unselectedItemColor: Colors.grey,
      backgroundColor:
          isDarkMode ? const Color(0xFF6D4C41) : const Color(0xFFD7CCC8),

      // Handle navigation
      onTap: (index) {
        if (index != currentIndex) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/products');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/cart');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/faq');
              break;
          }
        }
      },

      // Navigation items
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_cafe),
          label: 'Products',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.help_outline), label: 'FAQ'),
      ],
    );
  }
}
