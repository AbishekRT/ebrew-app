// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';
import 'screens/product.dart';
import 'screens/cart.dart';
import 'screens/faq.dart';
import 'screens/product_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eBrew App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.brown.shade900,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      themeMode: ThemeMode.system,
      home: const LoginPage(), // Initial screen
      routes: {
        '/home': (context) => const HomePage(),
        '/products': (context) => const ProductPage(),
        '/cart': (context) => CartScreen(), // Not const because of cartItems
        '/faq': (context) => const FAQPage(),
        '/product-detail': (context) => const ProductDetails(), // Add this line
      },
    );
  }
}
