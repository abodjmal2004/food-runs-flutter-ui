import 'package:flutter/material.dart';

class Starts extends StatefulWidget {
  const Starts({super.key});

  @override
  State<Starts> createState() => _StartsState();
}

class _StartsState extends State<Starts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // خلفية (اختياري) صورة pattern
            // إذا ما عندك صورة، احذف هذا Container
            Positioned.fill(
              child: Opacity(
                opacity: 0.15,
                child: Image.asset(
                  'lib/Imge/Group backgrond.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // المحتوى الرئيسي
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // صورة السكوتر
                  Image.asset(
                    'lib/Imge/skoter.png',
                    width: 220,
                  ),
                  const SizedBox(height: 18),

                  // العنوان
                  const Text(
                    'Food Runs',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
