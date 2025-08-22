import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_nav.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
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

  final List<Map<String, String>> _faqs = [
    {
      "q": "What is the NEED App?",
      "a":
          "NEED is a platform that connects you with skilled and verified service providers, called NeedExperts, for everything from home cleaning and plumbing to tech help, beauty services, and private tutoring — all based on your location.",
    },
    {
      "q": "How do I find a service near me?",
      "a":
          "Simply open the NEED App, select a service category, and we’ll show you the nearest available NeedExperts on the map. You can view profiles, ratings, and availability before booking",
    },
    {
      "q": "Do I need to pay before booking a service?",
      "a":
          "Some services may require an upfront payment using your NEED Coins, while others allow you to pay after the service is rendered. Each NeedExpert sets their own terms.",
    },
    {
      "q": "Is it safe to use NEED?",
      "a":
          "Yes. Every NeedExpert undergoes a mandatory verification and training process before being approved. We also offer support, ratings, and a resolution center for disputes.",
    },
    {
      "q": "Can I book services for someone else",
      "a":
          "Absolutely! You can enter a different address and contact number during the booking process",
    },
    {
      "q": "Can I cancel or reschedule a booking?",
      "a":
          "Yes. You can cancel or reschedule before the service begins via your dashboard. However, each NeedExpert has their own cancellation policy.",
    },
    {
      "q": "Is NEED available across cities?",
      "a":
          "NEED is expanding to new cities regularly. Check the app or website for current availability in your area.",
    },
    {
      "q": "How do I join the waitlist?",
      "a":
          "Just enter your name, phone number, and location in the waitlist form on our website or app. We’ll notify you as soon as a service becomes available in your city",
    },
    {
      "q": "Is the NEED App free to use?",
      "a":
          "Yes, it’s free to download and sign up. However, payments for services and coin activation apply depending on your role and usage",
    },
    {
      "q": "How can I contact support?",
      "a":
          "You can reach us via the in-app Help Center, email, or live chat. We’re here to help with booking, technical issues, and feedback.",
    },
  ];

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
          "Frequently Asked Questions",
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
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
          child: ListView.builder(
            itemCount: _faqs.length,
            itemBuilder: (context, idx) {
              final q = _faqs[idx]['q']!;
              final a = _faqs[idx]['a']!;
              return Container(
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            q,
                            style: const TextStyle(
                              fontFamily: 'RedditSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        // Small green underline beneath question (heading)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            width: 30,
                            height: 2.2,
                            color: const Color(0xFF14A388), // green underline
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      a,
                      style: const TextStyle(
                        fontFamily: 'RedditSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
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
