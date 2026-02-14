import 'package:flutter/material.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _bannerCtrl = PageController();
  int _bannerIndex = 0;

  // صور البنرات (إعلانات)
  final List<String> banners = [
    'lib/Imge/Group3144slider.png',
    'lib/Imge/Group3144slider.png',
    'lib/Imge/Group3144slider.png',
  ];

  final List<String> categories = ["Burger", "Pizza", "Drink", "Dessert"];
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // ===== Top Bar =====
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                  const Icon(Icons.location_on, color: Colors.red, size: 18),
                  const SizedBox(width: 4),
                  const Expanded(
                    child: Text(
                      "Freedom way, Lekki phase",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ClipOval(
                    child: Image.asset(
                      'lib/Imge/Group3144slider.png',
                      width: 34,
                      height: 34,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // ===== Search =====
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color(0xFFFFEFEF),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ===== Banner Slider (Images Only) =====
              SizedBox(
                height: 140,
                child: PageView.builder(
                  controller: _bannerCtrl,
                  itemCount: banners.length,
                  onPageChanged: (i) => setState(() => _bannerIndex = i),
                  itemBuilder: (context, i) {
                    return _BannerImage(path: banners[i]);
                  },
                ),
              ),

              const SizedBox(height: 10),

              // ===== Banner Dots =====
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  banners.length,
                      (i) => _dot(active: i == _bannerIndex),
                ),
              ),

              const SizedBox(height: 16),

              // ===== Categories =====
              SizedBox(
                height: 46,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, i) {
                    final active = i == selectedCategory;
                    return _categoryChip(
                      title: categories[i],
                      active: active,
                      onTap: () => setState(() => selectedCategory = i),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // ===== Products (Horizontal) =====
              SizedBox(
                height: 210,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) {
                    final isFirst = i % 2 == 0;
                    return _ProductCard(
                      title: isFirst ? "Chicken burger" : "Cheese burger",
                      rating: isFirst ? "3.8" : "4.5",
                      price: isFirst ? "\$20.00" : "\$15.00",
                      image: isFirst
                          ? 'lib/Imge/pngfind1pizza.png'
                          : 'lib/Imge/2-2-burger-1.png',
                      onAdd: () {},
                      width: 160,
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // ===== Popular =====
              Row(
                children: const [
                  Text(
                    "Popular Meal Menu",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    "See All",
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // ===== Popular List =====
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) => _popularItem(
                  image: 'lib/Imge/PhotoMenu-pizaaa.png',
                  title: "Pepper Pizza",
                  sub: "5kg box of Pizza",
                  price: "\$15",
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ===== Widgets =====
  Widget _dot({required bool active}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 18 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? Colors.red : Colors.black26,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _categoryChip({
    required String title,
    required bool active,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: active ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red),
        ),
        child: Row(
          children: [
            Icon(
              title == "Pizza" ? Icons.local_pizza : Icons.lunch_dining,
              size: 18,
              color: active ? Colors.white : Colors.red,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: active ? Colors.white : Colors.red,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _popularItem({
    required String image,
    required String title,
    required String sub,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 2),
                Text(sub,
                    style:
                    const TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

// ===== Banner Image =====
class _BannerImage extends StatelessWidget {
  final String path;
  const _BannerImage({required this.path});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }
}

// ===== Product Card (مرتبط بالتفاصيل) =====
class _ProductCard extends StatelessWidget {
  final String title;
  final String rating;
  final String price;
  final String image;
  final VoidCallback onAdd;
  final double width;

  const _ProductCard({
    required this.title,
    required this.rating,
    required this.price,
    required this.image,
    required this.onAdd,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProductDetailsScreen()),
        );
      },
      child: Container(
        width: width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 14),
                  const SizedBox(width: 3),
                  Text(rating, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Image.asset(image, height: 80, fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: onAdd,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
