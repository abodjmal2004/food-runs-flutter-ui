import 'package:flutter/material.dart';
import 'order_details.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ===== Top Image =====
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Image.asset(
                        'lib/Imge/pngfind1pizza.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // زر رجوع
                  Positioned(
                    left: 14,
                    top: 12,
                    child: _circleButton(
                      child: const Icon(Icons.arrow_back_ios_new,
                          size: 18, color: Colors.red),
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),

            // ===== Content =====
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 55,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEFEF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Popular",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Spacer(),
                        _circleButton(
                          child: const Icon(Icons.location_on,
                              color: Colors.red, size: 18),
                          onTap: () {},
                        ),
                        const SizedBox(width: 10),
                        _circleButton(
                          child: const Icon(Icons.favorite,
                              color: Colors.black, size: 18),
                          onTap: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      "Chicken Burger\nPromo Pack",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        height: 1.15,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 18),
                        const SizedBox(width: 6),
                        const Text(
                          "4.8 Rating",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 18),
                        const Icon(Icons.local_fire_department,
                            color: Colors.red, size: 18),
                        const SizedBox(width: 6),
                        const Text(
                          "2000+ Order",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum.",
                      style: TextStyle(color: Colors.black54, height: 1.45),
                    ),

                    const SizedBox(height: 14),

                    const Row(
                      children: [
                        Text("• ", style: TextStyle(fontSize: 18)),
                        Text("Chicken",
                            style: TextStyle(fontWeight: FontWeight.w700)),
                      ],
                    ),

                    const Spacer(),

                    // ✅ زر يفتح OrderDetailsScreen
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const OrderDetailsScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Add To Chart",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _circleButton({
    required Widget child,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: Color(0xFFF6F6F6),
          shape: BoxShape.circle,
        ),
        child: Center(child: child),
      ),
    );
  }
}
