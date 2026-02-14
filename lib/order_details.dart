import 'package:flutter/material.dart';
import 'finish_order.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  // بيانات مؤقتة
  final List<_OrderItem> items = [
    _OrderItem(
      title: "Chicken Burger",
      sub: "Burger Factory LTD",
      price: 20,
      image: 'lib/Imge/pngfind1pizza.png',
    ),
    _OrderItem(
      title: "Onion Pizza",
      sub: "Pizza Palace",
      price: 15,
      image: 'lib/Imge/PhotoMenu-pizaaa.png',
    ),
    _OrderItem(
      title: "Spicy Shawarma",
      sub: "Hot Cool Spot",
      price: 15,
      image: 'lib/Imge/2-2-burger-1.png',
    ),
  ];

  int get subTotal => items.fold(0, (sum, e) => sum + (e.price * e.count));

  int delivery = 10;
  int discount = 10;

  int get total => subTotal + delivery - discount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ===== Top Bar =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "Order details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ===== List =====
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, i) {
                  final item = items[i];
                  return _itemCard(item);
                },
              ),
            ),

            // ===== Bottom Red Card =====
            Container(
              margin: const EdgeInsets.fromLTRB(18, 8, 18, 18),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  _rowPrice("Sub-Total", "\$$subTotal"),
                  const SizedBox(height: 6),
                  _rowPrice("Delivery Charge", "\$$delivery"),
                  const SizedBox(height: 6),
                  _rowPrice("Discount", "\$$discount"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$$total",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // ✅ ربط الزر مع FinishOrderScreen
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const FinishOrderScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Place My Order",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // ===== Item Card =====
  Widget _itemCard(_OrderItem item) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item.image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    style: const TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 2),
                Text(item.sub,
                    style: const TextStyle(fontSize: 12, color: Colors.black54)),
                const SizedBox(height: 4),
                Text(
                  "\$ ${item.price}",
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _qtyBtn(
                icon: Icons.remove,
                onTap: () {
                  if (item.count > 1) {
                    setState(() => item.count--);
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "${item.count}",
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              _qtyBtn(
                icon: Icons.add,
                red: true,
                onTap: () => setState(() => item.count++),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _qtyBtn({
    required IconData icon,
    required VoidCallback onTap,
    bool red = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: red ? Colors.red : Colors.red.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 16,
          color: red ? Colors.white : Colors.red,
        ),
      ),
    );
  }

  Widget _rowPrice(String left, String right) {
    return Row(
      children: [
        Text(left, style: const TextStyle(color: Colors.white70)),
        const Spacer(),
        Text(
          right,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

// ===== Model =====
class _OrderItem {
  final String title;
  final String sub;
  final int price;
  final String image;
  int count;

  _OrderItem({
    required this.title,
    required this.sub,
    required this.price,
    required this.image,
    this.count = 1,
  });
}
