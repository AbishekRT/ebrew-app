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

      selectedItemColor:
          isDarkMode ? const Color(0xFFFFAB91) : const Color(0xFF4E342E),
      unselectedItemColor:
          isDarkMode
              ? Colors.grey[400]
              : const Color.fromARGB(255, 165, 129, 117),

      backgroundColor:
          isDarkMode ? const Color(0xFF6D4C41) : const Color(0xFFD7CCC8),

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
