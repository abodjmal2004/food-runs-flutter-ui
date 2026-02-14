import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'set_location_screen.dart';



class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int tab = 0; // 0 = Create Account, 1 = Login

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),

              // خلفية خفيفة + صورة الأكل (زي الصورة)
              Container(
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0xFFFFF2F2),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.12,
                        child: Image.asset(
                          'lib/Imge/Pattern1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'lib/Imge/Illustration1auth.png',
                        height: 170,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Tabs
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => tab = 0),
                      child: _tabItem(title: "Create Account", active: tab == 0),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => tab = 1),
                      child: _tabItem(title: "Login", active: tab == 1),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              if (tab == 0) ...[
                _label("Full Name"),
                _field(hint: "Segun Phillips"),
                const SizedBox(height: 12),

                _label("Email address"),
                _field(hint: "segunphillips@gmail.com"),
                const SizedBox(height: 12),

                _label("Password"),
                _field(hint: "********", isPassword: true),
                const SizedBox(height: 18),

                _primaryButton(text: "Sign Up", onTap: () {}),
                const SizedBox(height: 12),
                _googleButton(text: "Sign up with Google", onTap: () {}),
              ] else ...[
                _label("Email address"),
                _field(hint: "segunphillips@gmail.com"),
                const SizedBox(height: 12),

                _label("Password"),
                _field(hint: "********", isPassword: true),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                ),

                _primaryButton(
                  text: "Login",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const SetLocationScreen()),
                    );
                  },
                ),

                const SizedBox(height: 12),
                _googleButton(text: "Login with Google", onTap: () {}),
              ],

              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabItem({required String title, required bool active}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: active ? Colors.red : Colors.black54,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 2,
          width: 90,
          color: active ? Colors.red : Colors.transparent,
        ),
      ],
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  Widget _field({required String hint, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _primaryButton({required String text, required VoidCallback onTap}) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
    );
  }

  Widget _googleButton({required String text, required VoidCallback onTap}) {
    return SizedBox(
      height: 52,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFFF6F6F6),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/Imge/ic_google.png', height: 18),
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
