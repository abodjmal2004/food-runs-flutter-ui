
import 'package:flutter/material.dart';
import 'strtscreen.dart';
import 'strtscreen2.dart';
import 'onboarding_flow.dart';
import 'onboarding3.dart';
import 'auth_screen.dart';
import 'profile_screen.dart';
import 'set_location_screen.dart';
import 'home_screen.dart';
import 'product_details_screen.dart';
import 'main_layout.dart';
import 'order_details.dart';
import 'finish_order.dart';
import 'meal_menu_screen.dart';
import 'chat_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingFlow(),
    );
  }
}
