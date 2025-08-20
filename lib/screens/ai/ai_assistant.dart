import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_nav.dart';

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
    // For demonstration, mock chat bubbles
    final List<Widget> chatBubbles = List.generate(5, (index) {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF14A388),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Add your chat interaction logic here
                },
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
        ],
      );
    });

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
            children: [
              const SizedBox(height: 14),
              Expanded(child: ListView(children: chatBubbles)),
              const SizedBox(height: 12),
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
                    Navigator.pushReplacementNamed(context, '/ai_help_centre');
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
