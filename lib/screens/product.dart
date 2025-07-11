import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  final List<Map<String, String>> sampleProducts = const [
    {'name': 'Classic Roast', 'price': '1200', 'image': 'assets/1.png'},
    {'name': 'Dark Espresso', 'price': '1400', 'image': 'assets/6.jpg'},
    {'name': 'Vanilla Latte', 'price': '1600', 'image': 'assets/3.png'},
    {'name': 'Hazelnut Brew', 'price': '1550', 'image': 'assets/4.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("eBrew Café"),
        backgroundColor: isDark ? const Color(0xFF6D4C41) : Colors.brown,
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 1),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth > 600;

              return ListView(
                children: [
                  // Hero Banner
                  Stack(
                    children: [
                      Image.asset(
                        'assets/B1.png',
                        width: double.infinity,
                        height: isWideScreen ? 300 : 200,
                        fit: BoxFit.cover,
                      ),
                      Positioned.fill(
                        child: Container(
                          color: const Color.fromRGBO(0, 0, 0, 0.4),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Ebrew Café',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Handpicked brews, delivered with care',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Product Categories
                  _buildProductSection(
                    context,
                    "Featured Collection",
                    orientation,
                    sampleProducts,
                  ),
                  _buildProductSection(
                    context,
                    "Best Sellers",
                    orientation,
                    sampleProducts,
                  ),
                  _buildProductSection(
                    context,
                    "New Arrivals",
                    orientation,
                    sampleProducts,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildProductSection(
    BuildContext context,
    String title,
    Orientation orientation,
    List<Map<String, String>> products,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 6, height: 24, color: Colors.red),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
            shrinkWrap: true,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            children:
                products
                    .map((product) => _buildProductCard(product, context))
                    .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Redirect only for certain products
        if (product['name'] == 'Classic Roast' ||
            product['name'] == 'Dark Espresso') {
          Navigator.pushNamed(context, '/product-detail');
        }
      },
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(product['image']!, fit: BoxFit.contain),
              ),
              const SizedBox(height: 8),
              Text(
                product['name']!,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'Rs. ${product['price']}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
