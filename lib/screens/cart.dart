import 'package:flutter/material.dart';
import 'package:ebrew/widgets/bottom_nav.dart'; // Import the shared bottom nav

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      'id': 1,
      'name': 'Cappuccino',
      'price': 550.0,
      'quantity': 1,
      'image': 'https://via.placeholder.com/100',
    },
    {
      'id': 2,
      'name': 'Latte',
      'price': 600.0,
      'quantity': 2,
      'image': 'https://via.placeholder.com/100',
    },
  ];

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    double subtotal = cartItems.fold(
      0,
      (sum, item) => sum + item['price'] * item['quantity'],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        backgroundColor: isDark ? Colors.brown[900] : Colors.brown,
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 2),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 600;

              if (cartItems.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://cdn-icons-png.flaticon.com/512/2038/2038854.png',
                        height: 100,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Your Cart is Empty",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text("Start adding your favorite brews!"),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Explore Products"),
                      ),
                    ],
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                    orientation == Orientation.portrait || !isWide
                        ? Column(
                          children: [
                            Expanded(child: CartItemList(cartItems)),
                            SummaryBox(subtotal: subtotal),
                          ],
                        )
                        : Row(
                          children: [
                            Expanded(flex: 2, child: CartItemList(cartItems)),
                            Expanded(
                              flex: 1,
                              child: SummaryBox(subtotal: subtotal),
                            ),
                          ],
                        ),
              );
            },
          );
        },
      ),
    );
  }
}

class CartItemList extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartItemList(this.cartItems, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];

        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Image.network(
                  item['image'],
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Rs. ${item['price']}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 12),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // handle decrement
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      "${item['quantity']}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        // handle increment
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // handle delete
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SummaryBox extends StatelessWidget {
  final double subtotal;

  const SummaryBox({required this.subtotal, super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Summary",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Subtotal"),
              Text("Rs. ${subtotal.toStringAsFixed(2)}"),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Shipping"), Text("–")],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Taxes"), Text("–")],
          ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Rs. ${subtotal.toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Navigate to checkout
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text("Checkout", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
