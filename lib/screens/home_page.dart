import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> coffeeProducts = const [
    {
      'name': 'Espresso',
      'image':
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=600&q=80',
    },
    {
      'name': 'Cappuccino',
      'image':
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=600&q=80',
    },
    {
      'name': 'Latte',
      'image':
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=600&q=80',
    },
    {
      'name': 'Mocha',
      'image':
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=600&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final isWide = MediaQuery.of(context).size.width > 600;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final headlineStyle = TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? const Color(0xFFFFF3E0) : const Color(0xFF3E2723),
    );

    final sectionTitleStyle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: isDarkMode ? const Color(0xFFFFCCBC) : const Color(0xFF4E342E),
    );

    final bodyTextStyle = TextStyle(
      fontSize: 16,
      height: 1.5,
      color: isDarkMode ? const Color(0xFFFFCCBC) : const Color(0xFF5D4037),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('eBrew'),
        centerTitle: true,
        backgroundColor:
            isDarkMode ? const Color(0xFF4E342E) : const Color(0xFFD7CCC8),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero Banner
            Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1541167760496-1628856ab772?auto=format&fit=crop&w=1200&q=80',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.black.withAlpha(102),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to eBrew Café',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Your favorite brews & gadgets in one place.',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Welcome Text Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Start Your Day Right ☕', style: headlineStyle),
                  const SizedBox(height: 8),
                  Text(
                    'Discover handcrafted coffee from the best beans. Find your favorites and fuel your mornings with love.',
                    style: bodyTextStyle,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Best Selling Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Best Selling Products', style: sectionTitleStyle),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  isLandscape || isWide
                      ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 4 / 3,
                            ),
                        itemCount: coffeeProducts.length,
                        itemBuilder:
                            (context, index) => _buildProductCard(
                              coffeeProducts[index],
                              isDarkMode,
                            ),
                      )
                      : Column(
                        children:
                            coffeeProducts
                                .map(
                                  (product) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: _buildProductCard(
                                      product,
                                      isDarkMode,
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 0),
    );
  }

  Widget _buildProductCard(Map<String, String> product, bool isDarkMode) {
    return Card(
      color: isDarkMode ? const Color(0xFF3E2723) : const Color(0xFFFFF3E0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              product['image']!,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Freshly brewed just for you!',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode ? Colors.orange[200] : Colors.brown[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
