import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_nav.dart';
import 'ai_help_centre.dart';

class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({Key? key}) : super(key: key);

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  int _currentIndex = 1;

  void _onNavTap(int idx) {
    setState(() => _currentIndex = idx);
    if (idx == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (idx == 2) {
      Navigator.pushReplacementNamed(context, '/my_profile');
    }
    // idx==1 is AI Support (current)
  }

  @override
  Widget build(BuildContext context) {
    // Show a few more AI/user message pairs, but keep it scroll-free for practical mobile screens.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black, size: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "AI Assistant",
          style: TextStyle(
            fontFamily: 'RedditSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(26),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Welcome to AI Assistant, your chats are secured with AI assistant",
              style: TextStyle(
                fontFamily: 'RedditSans',
                fontWeight: FontWeight.w400,
                fontSize: 13.5,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              // AI message 1
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    "Hello there! How may I help you today?",
                    style: TextStyle(
                      fontFamily: 'RedditSans',
                      fontSize: 14.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              // User message 1
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF14A388),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 9,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "I would like to ask a question",
                      style: TextStyle(
                        fontFamily: 'RedditSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // AI message 2
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    "Sure! Please type your question below.",
                    style: TextStyle(
                      fontFamily: 'RedditSans',
                      fontSize: 14.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              // User message 2
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF14A388),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 9,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "How do I book a service?",
                      style: TextStyle(
                        fontFamily: 'RedditSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // AI message 3
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    "To book a service, go to the home screen, select your desired category and provider, then follow the on-screen steps to complete your booking.",
                    style: TextStyle(
                      fontFamily: 'RedditSans',
                      fontSize: 14.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF14A388),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 1.5,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AiHelpCentreScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "End Conversation",
                    style: TextStyle(
                      fontFamily: 'RedditSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
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
