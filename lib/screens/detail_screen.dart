import 'package:flutter/material.dart';
import '../models/coffee.dart';

class DetailScreen extends StatelessWidget {
  final Coffee coffee;

  DetailScreen({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coffee.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Image.asset(coffee.image, height: 150),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(coffee.description, style: TextStyle(fontSize: 16)),
          ),
          Text(
            "\$${coffee.price.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 24),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Add to Cart")),
        ],
      ),
    );
  }
}
