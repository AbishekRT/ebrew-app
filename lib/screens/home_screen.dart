import 'package:flutter/material.dart';
import '../models/coffee.dart';
import '../widgets/coffee_card.dart';
import 'detail_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Coffee> coffees = [
    Coffee("Cappuccino", "Rich and foamy", 4.5, 'assets/cappuccino.png'),
    Coffee("Latte", "Smooth and creamy", 4.0, 'assets/latte.png'),
    Coffee("Espresso", "Strong and bold", 3.0, 'assets/espresso.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CoffeeMate")),
      body: ListView.builder(
        itemCount: coffees.length,
        itemBuilder: (context, index) {
          return CoffeeCard(
            coffee: coffees[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(coffee: coffees[index]),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (i) {
          if (i == 1)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CartScreen()),
            );
          if (i == 2)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfileScreen()),
            );
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.coffee), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
