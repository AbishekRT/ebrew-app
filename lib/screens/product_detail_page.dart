import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root widget with dark/light mode support
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eBrew Cafe',
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: const Color(0xFFcc0000)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(primary: const Color(0xFFcc0000)),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const ProductDetailsPage(),
    );
  }
}

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;

  final Map<String, String> product = {
    'name': 'Colombian Dark Roast',
    'price': '1500',
    'image': 'https://via.placeholder.com/200',
    'description': 'A rich, bold coffee with hints of chocolate.',
    'tastingNotes': 'Chocolate, Nutty, Smooth finish.',
    'shipping': 'Free delivery within 3 days. Easy returns.',
    'roastDate': '2025-06-01',
  };

  void _changeQuantity(int delta) {
    setState(() {
      quantity = (quantity + delta).clamp(1, 99);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(title: const Text('Product Details'), centerTitle: true),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedIndex: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            isWide
                ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildImage()),
                    const SizedBox(width: 24),
                    Expanded(child: _buildDetails()),
                  ],
                )
                : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildImage(),
                      const SizedBox(height: 20),
                      _buildDetails(),
                    ],
                  ),
                ),
      ),
    );
  }

  Widget _buildImage() {
    return Center(
      child: Image.network(
        product['image']!,
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product['name']!,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 4),
        Text(
          "Rs. ${product['price']}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Text(
          product['description']!,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Divider(height: 32),
        _buildInfoSection("Taste Notes", product['tastingNotes']!),
        _buildInfoSection("Shipping and Returns", product['shipping']!),
        _buildInfoSection("Roast Date", product['roastDate']!),
        const SizedBox(height: 24),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => _changeQuantity(-1),
                    icon: const Icon(Icons.remove),
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _changeQuantity(1),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added $quantity item(s) to your cart.'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFcc0000),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Buy Now'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(content, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
