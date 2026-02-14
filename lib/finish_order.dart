import 'package:flutter/material.dart';
import 'main_layout.dart';

class FinishOrderScreen extends StatefulWidget {
  const FinishOrderScreen({super.key});

  @override
  State<FinishOrderScreen> createState() => _FinishOrderScreenState();
}

class _FinishOrderScreenState extends State<FinishOrderScreen> {
  int rating = 3; // افتراضي 3 نجوم
  final TextEditingController feedback = TextEditingController();

  @override
  void dispose() {
    feedback.dispose();
    super.dispose();
  }

  void _goHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const MainLayout()),
          (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 24),

              // خلفية باترن خفيفة
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.10,
                        child: Image.asset(
                          'lib/Imge/Pattern1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Column(
                      children: [
                        const SizedBox(height: 40),

                        // الدائرة + صح
                        Container(
                          width: 74,
                          height: 74,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.check, color: Colors.white, size: 36),
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          "Thank You!\nOrder Completed",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            height: 1.15,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "Please rate your last Driver",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.35),
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 18),

                        // النجوم
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (i) {
                            final star = i + 1;
                            return IconButton(
                              onPressed: () => setState(() => rating = star),
                              icon: Icon(
                                Icons.star,
                                size: 30,
                                color: star <= rating ? Colors.orange : Colors.black12,
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 14),

                        // Feedback field
                        TextField(
                          controller: feedback,
                          decoration: InputDecoration(
                            hintText: "Leave feedback",
                            prefixIcon: const Icon(Icons.edit, color: Colors.red),
                            filled: true,
                            fillColor: const Color(0xFFF6F6F6),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const Spacer(),

                        // Submit + Skip
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 52,
                                child: ElevatedButton(
                                  onPressed: _goHome,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            TextButton(
                              onPressed: _goHome,
                              child: const Text(
                                "Skip",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 18),
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
}
