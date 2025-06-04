// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/login_screen.dart';

void main() => runApp(CoffeeMate());

class CoffeeMate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoffeeMate',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.brown,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.brown,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
