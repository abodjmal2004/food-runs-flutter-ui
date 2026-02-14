import 'package:flutter/material.dart';

class MealMenuScreen extends StatelessWidget {
  const MealMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = const [
      _MealItem(
        title: "Chicken Spaghetti",
        sub: "1 Big Pack",
        price: 7,
        image: "lib/Imge/PhotoMenu-pizaaa.png", // غيّر حسب صورك
      ),
      _MealItem(
        title: "Jollof Rice",
        sub: "1 Combo pack",
        price: 10,
        image: "lib/Imge/pngfind1pizza.png",
      ),
      _MealItem(
        title: "Fruity Pancakes",
        sub: "Noodle Home",
        price: 12,
        image: "lib/Imge/PhotoMenu-pizaaa.png",
      ),
      _MealItem(
        title: "Pepper Pizza",
        sub: "5kg box of Pizza",
        price: 15,
        image: "lib/Imge/pngfind1pizza.png",
      ),
    ];

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
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "Meal Menu",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none),
                  ),
                ],
              ),

              const SizedBox(height: 8),

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

              const SizedBox(height: 14),

              // ===== Items =====
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) => _mealTile(items[i]),
              ),

              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mealTile(_MealItem item) {
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
            child: Image.asset(
              item.image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 2),
                Text(
                  item.sub,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
          Text(
            "\$${item.price}",
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _MealItem {
  final String title;
  final String sub;
  final int price;
  final String image;

  const _MealItem({
    required this.title,
    required this.sub,
    required this.price,
    required this.image,
  });
}
