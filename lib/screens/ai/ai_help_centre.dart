import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_nav.dart';

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
      Navigator.pushReplacementNamed(context, '/home');
    } else if (idx == 2) {
      Navigator.pushReplacementNamed(context, '/my_profile');
    }
    // idx==1 is AI Support
  }

  Widget _helpButton({
    required IconData icon,
    required String label,
    required String route,
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
        leading: Icon(icon, color: Colors.black, size: 26),
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
        onTap: () => Navigator.pushNamed(context, route),
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
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () => Navigator.of(context).pop(),
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
                icon: Icons.help_outline,
                label: "FAQs",
                route: '/faqs', // points to faqs.dart
              ),
              _helpButton(
                icon: Icons.headset_mic_outlined,
                label: "Talk to Agent",
                route: '/talk_to_agent', // points to talk_to_agent.dart
              ),
              _helpButton(
                icon: Icons.report_gmailerrorred_outlined,
                label: "Report an Issue",
                route: '/talk_to_agent', // points to talk_to_agent.dart
              ),
              _helpButton(
                icon: Icons.smart_toy_outlined,
                label: "Chat with AI Assistant",
                route: '/chat_with_ai', // points to chat_with_ai.dart
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
