import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_nav.dart';

class TalkToAgentScreen extends StatefulWidget {
  const TalkToAgentScreen({Key? key}) : super(key: key);

  @override
  State<TalkToAgentScreen> createState() => _TalkToAgentScreenState();
}

class _TalkToAgentScreenState extends State<TalkToAgentScreen> {
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

  Widget _contactItem({
    required IconData icon,
    required String text,
    required String buttonLabel,
    required VoidCallback onPressed,
    Color? iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xFFE7F6F3),
            child: Icon(
              icon,
              color: iconColor ?? const Color(0xFF14A388),
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'RedditSans',
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 36,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                side: const BorderSide(color: Color(0xFF14A388), width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              onPressed: onPressed,
              child: Text(
                buttonLabel,
                style: const TextStyle(
                  fontFamily: 'RedditSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color(0xFF14A388),
                ),
              ),
            ),
          ),
        ],
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
          "Talk to Agent",
          style: TextStyle(
            fontFamily: 'RedditSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 18),
              // Agent Image
              SizedBox(
                height: 110,
                child: Image.asset(
                  "Assets/call agent image.png",
                  fit: BoxFit.contain,
                  height: 110,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                "Hello! Talk to an Agent",
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              const Text(
                "Talk to an agent, resolve problems, ask questions, make a complaint and many more",
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.5,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 22),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.09),
                      blurRadius: 11,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Contact Information",
                      style: TextStyle(
                        fontFamily: 'RedditSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "Below is NEED App contact for more information or enquiry from an Agent",
                      style: TextStyle(
                        fontFamily: 'RedditSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 18),
                    // Call Agent
                    _contactItem(
                      icon: Icons.call,
                      text: "+234 904 251 2356",
                      buttonLabel: "Call Agent",
                      onPressed: () {
                        // You can use url_launcher to launch phone call
                      },
                    ),
                    // WhatsApp
                    _contactItem(
                      icon: Icons.whatsapp,
                      text: "+234 904 251 2356",
                      buttonLabel: "WhatsApp",
                      onPressed: () {
                        // You can use url_launcher to launch WhatsApp
                      },
                      iconColor: Colors.green[700],
                    ),
                    // Email
                    _contactItem(
                      icon: Icons.email_outlined,
                      text: "needserviceapp@gmail.com",
                      buttonLabel: "Send Mail",
                      onPressed: () {
                        // You can use url_launcher to launch mailto
                      },
                      iconColor: Colors.blue[700],
                    ),
                  ],
                ),
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
