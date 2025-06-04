import 'package:flutter/material.dart';
import '../models/coffee.dart';

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;
  final VoidCallback onTap;

  CoffeeCard({required this.coffee, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      child: ListTile(
        leading: Image.asset(coffee.image, width: 50, height: 50),
        title: Text(coffee.name),
        subtitle: Text("\$${coffee.price.toStringAsFixed(2)}"),
        onTap: onTap,
      ),
    );
  }
}
