import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/custom_bottom_nav.dart';

class TalkToAgentScreen extends StatefulWidget {
  const TalkToAgentScreen({super.key});

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
  }

  Widget _contactItem({
    required Widget icon,
    required String text,
    required String buttonLabel,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          icon,
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
                elevation: 6,
                shadowColor: Colors.black.withAlpha(38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18),
                side: BorderSide.none,
              ),
              onPressed: onPressed,
              child: Text(
                buttonLabel,
                style: const TextStyle(
                  fontFamily: 'RedditSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _whatsappCircleIcon() {
    return CircleAvatar(
      radius: 22,
      backgroundColor: const Color(0xFF14A388),
      child: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 28),
    );
  }

  Widget _callCircleIcon() {
    return CircleAvatar(
      radius: 22,
      backgroundColor: const Color(0xFF14A388),
      child: Icon(Icons.call, color: Colors.white, size: 28),
    );
  }

  Widget _emailCircleIcon() {
    return CircleAvatar(
      radius: 22,
      backgroundColor: const Color(0xFF14A388),
      child: Icon(Icons.email_outlined, color: Colors.white, size: 28),
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
                      color: Colors.black.withAlpha(23),
                      blurRadius: 11,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Contact Information",
                      style: TextStyle(
                        fontFamily: 'RedditSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
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
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 18),
                    // Call Agent
                    _contactItem(
                      icon: _callCircleIcon(),
                      text: "+234 904 251 2356",
                      buttonLabel: "Call Agent",
                      onPressed: () {
                        // launch phone call
                      },
                    ),
                    // WhatsApp
                    _contactItem(
                      icon: _whatsappCircleIcon(),
                      text: "+234 904 251 2356",
                      buttonLabel: "WhatsApp",
                      onPressed: () {
                        // launch WhatsApp
                      },
                    ),
                    // Email
                    _contactItem(
                      icon: _emailCircleIcon(),
                      text: "needserviceapp@gmail.com",
                      buttonLabel: "Send Mail",
                      onPressed: () {
                        // launch mailto
                      },
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
