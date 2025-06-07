import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> coffeeProducts = const [
    {
      'name': 'Espresso',
      'image':
          'https://images.unsplash.com/photo-1588001379565-3fdc36dc1837?auto=format&fit=crop&w=600&q=80',
    },
    {
      'name': 'Cappuccino',
      'image':
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=600&q=80',
    },
    {
      'name': 'Latte',
      'image':
          'https://images.unsplash.com/photo-1559628233-4e8c7f716bbd?auto=format&fit=crop&w=600&q=80',
    },
    {
      'name': 'Mocha',
      'image':
          'https://images.unsplash.com/photo-1618411378064-e94b7b8ceff0?auto=format&fit=crop&w=600&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final screenWidth = MediaQuery.of(context).size.width;

    final headingStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? const Color(0xFFFFF3E0) : const Color(0xFF3E2723),
    );

    final subtextStyle = TextStyle(
      fontSize: 16,
      color: isDarkMode ? const Color(0xFFFFCCBC) : const Color(0xFF5D4037),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to eBrew'),
        centerTitle: true,
        backgroundColor:
            isDarkMode ? const Color(0xFF4E342E) : const Color(0xFFD7CCC8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Our Coffee Collection', style: headingStyle),
            const SizedBox(height: 8),
            Text('Explore and enjoy your favorites!', style: subtextStyle),
            const SizedBox(height: 16),
            Expanded(
              child:
                  isLandscape || screenWidth > 600
                      ? GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 4 / 3,
                        children:
                            coffeeProducts.map((product) {
                              return _buildProductCard(product, isDarkMode);
                            }).toList(),
                      )
                      : ListView(
                        children:
                            coffeeProducts.map((product) {
                              return _buildProductCard(product, isDarkMode);
                            }).toList(),
                      ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:
            isDarkMode ? const Color(0xFFFFAB91) : const Color(0xFF4E342E),
        unselectedItemColor: Colors.grey,
        backgroundColor:
            isDarkMode ? const Color(0xFF6D4C41) : const Color(0xFFD7CCC8),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_cafe),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment'),
        ],
        currentIndex: 0,
        onTap: (index) {
          // In real app, you can navigate to other pages here
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product, bool isDarkMode) {
    return Card(
      color: isDarkMode ? const Color(0xFF3E2723) : const Color(0xFFFFF3E0),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(
          product['image']!,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(
          product['name']!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        subtitle: const Text('Freshly brewed just for you!'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Show product details in a real app
        },
      ),
    );
  }
}
