import 'package:flutter/material.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              const SizedBox(height: 24),

              // صورة الأكل + خلفية دائرية وردي (زي الصورة)
              Expanded(
                flex: 6,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 260,
                        height: 260,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD6D6),
                          borderRadius: BorderRadius.circular(130),
                        ),
                      ),
                      Image.asset(
                        'lib/Imge/Illustartion1.png',
                        width: 240,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // العنوان + الوصف
              Expanded(
                flex: 3,
                child: Column(
                  children: const [
                    Text(
                      'Select the\nFavorites Menu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1E1E1E),
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Now eat well, don't leave the house.\nYou can choose your favorite food only with\none click",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              // زر Next + Skip + مؤشرات
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          // لاحقاً: نروح للصفحة الثالثة
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Skip (لاحقاً: نروح للهوم)
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),

                        // نقاط الصفحة (Indicator)
                        Row(
                          children: [
                            _dot(isActive: false),
                            const SizedBox(width: 6),
                            _dot(isActive: true),
                            const SizedBox(width: 6),
                            _dot(isActive: false),
                          ],
                        ),

                        IconButton(
                          onPressed: () {
                            // سهم صغير يمين (اختياري)
                          },
                          icon: const Icon(Icons.arrow_forward_ios, size: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _dot({required bool isActive}) {
    return Container(
      width: isActive ? 18 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.black26,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
