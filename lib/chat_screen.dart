import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _msg = TextEditingController();
  final ScrollController _scroll = ScrollController();

  final List<_ChatBubble> messages = [
    _ChatBubble(
      fromMe: false,
      text: "Hello! my name is Food Runs\nbefore we start, what is your name?",
    ),
    _ChatBubble(fromMe: true, text: "Segun Phillips"),
    _ChatBubble(
      fromMe: false,
      text: "Hello! Segun 👋. I can converse\nin your preferred language. How\nmay I help you today?",
    ),
    _ChatBubble(fromMe: true, text: "Is there Basmati Rice\nand pepper chicken?"),
    _ChatBubble(fromMe: false, text: "....."),
  ];

  @override
  void dispose() {
    _msg.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _send() {
    final t = _msg.text.trim();
    if (t.isEmpty) return;

    setState(() {
      messages.add(_ChatBubble(fromMe: true, text: t));
      _msg.clear();
    });

    // انزل لآخر الرسائل
    Future.delayed(const Duration(milliseconds: 50), () {
      if (_scroll.hasClients) {
        _scroll.animateTo(
          _scroll.position.maxScrollExtent + 120,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

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
                    "Chat",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none, color: Colors.red),
                  ),
                ],
              ),
            ),

            // ===== Messages =====
            Expanded(
              child: Stack(
                children: [
                  // خلفية باترن خفيفة (إذا عندك Pattern1.png)
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.10,
                      child: Image.asset(
                        'lib/Imge/Pattern1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  ListView.builder(
                    controller: _scroll,
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
                    itemCount: messages.length + 1,
                    itemBuilder: (context, i) {
                      if (i == 0) {
                        // زر الروبوت الأحمر (مثل الصورة)
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 46,
                            height: 46,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.support_agent,
                                color: Colors.white, size: 22),
                          ),
                        );
                      }

                      final m = messages[i - 1];
                      return _bubble(m);
                    },
                  ),
                ],
              ),
            ),

            // ===== Input Bar =====
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEFEF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.link, color: Colors.red),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: Container(
                      height: 46,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _msg,
                              decoration: const InputDecoration(
                                hintText: "Type here...",
                                border: InputBorder.none,
                              ),
                              onSubmitted: (_) => _send(),
                            ),
                          ),
                          InkWell(
                            onTap: _send,
                            borderRadius: BorderRadius.circular(20),
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(Icons.double_arrow,
                                  color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _bubble(_ChatBubble m) {
    final align = m.fromMe ? Alignment.centerRight : Alignment.centerLeft;
    final bg = m.fromMe ? Colors.red : const Color(0xFFF6F6F6);
    final color = m.fromMe ? Colors.white : Colors.black87;

    return Align(
      alignment: align,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          m.text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w700,
            height: 1.25,
          ),
        ),
      ),
    );
  }
}

class _ChatBubble {
  final bool fromMe;
  final String text;
  _ChatBubble({required this.fromMe, required this.text});
}
