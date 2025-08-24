import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../home.dart';
import '../ai/faqs.dart';
import '../ai/talk_to_agent.dart';
import '../ai/chat_with_ai.dart';

class AiHelpCentreScreen extends StatefulWidget {
  const AiHelpCentreScreen({Key? key}) : super(key: key);

  @override
  State<AiHelpCentreScreen> createState() => _AiHelpCentreScreenState();
}

class _AiHelpCentreScreenState extends State<AiHelpCentreScreen> {
  int _currentIndex = 1;

  void _onNavTap(int idx) {
    setState(() => _currentIndex = idx);
    if (idx == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Home()),
      );
    } else if (idx == 2) {
      Navigator.pushReplacementNamed(context, '/my_profile');
    }
    // idx==1 is AI Support
  }

  Widget _helpButton({
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
        leading: icon,
        title: Text(
          label,
          style: const TextStyle(
            fontFamily: 'RedditSans',
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.black,
          size: 24,
        ),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black, size: 28),
          onPressed:
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Home()),
              ),
        ),
        title: const Text(
          "AI Help Center",
          style: TextStyle(
            fontFamily: 'RedditSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
          child: Column(
            children: [
              _helpButton(
                icon: const Icon(
                  Icons.help_outline,
                  color: Colors.black,
                  size: 26,
                ),
                label: "FAQs",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const FaqsScreen()),
                  );
                },
              ),
              _helpButton(
                icon: const Icon(
                  Icons.headset_mic_outlined,
                  color: Colors.black,
                  size: 26,
                ),
                label: "Talk to Agent",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TalkToAgentScreen(),
                    ),
                  );
                },
              ),
              _helpButton(
                icon: const Icon(
                  Icons.report_gmailerrorred_outlined,
                  color: Colors.black,
                  size: 26,
                ),
                label: "Report an Issue",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TalkToAgentScreen(),
                    ),
                  );
                },
              ),
              _helpButton(
                icon: Image.asset(
                  'Assets/artificial-intelligence.png',
                  width: 26,
                  height: 26,
                  fit: BoxFit.contain,
                ),
                label: "Chat with AI Assistant",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ChatWithAiScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
