import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool usCitizen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // Top bar
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "Profile",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Avatar
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundImage: AssetImage('lib/Imge/imge-31-content-31-iPhone13mini-1.png'),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.edit, size: 12, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 16),

              const Text("Personal Info",
                  style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 10),

              _card(
                child: Column(
                  children: [
                    _rowItem("Your name", "Mommy Jason"),
                    const Divider(height: 18),
                    _rowItem("Occupation", "Manager"),
                    const Divider(height: 18),
                    _rowItem("Employer", "Overlay Design"),
                    const Divider(height: 18),
                    Row(
                      children: [
                        const Expanded(
                          child: Text("U.S Citizen",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ),
                        Switch(
                          value: usCitizen,
                          onChanged: (v) => setState(() => usCitizen = v),
                          activeColor: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              const Text("Contact Info",
                  style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 10),

              _card(
                child: Column(
                  children: const [
                    _ContactRow(icon: Icons.phone, text: "+234 806 2856 543"),
                    Divider(height: 18),
                    _ContactRow(icon: Icons.email, text: "segunphillips@mail.com"),
                  ],
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }

  Widget _rowItem(String left, String right) {
    return Row(
      children: [
        Expanded(
          child: Text(left, style: const TextStyle(color: Colors.black54)),
        ),
        Text(right, style: const TextStyle(fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.black54),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
      ],
    );
  }
}
