import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_nav.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  int _currentIndex = 2;

  void _onNavTap(int idx) {
    setState(() => _currentIndex = idx);
    if (idx == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (idx == 1) {
      Navigator.pushReplacementNamed(context, '/ai_help_centre');
    }
    // idx == 2 is account screen
  }

  Widget sectionCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 22),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = const TextStyle(
      fontFamily: 'RedditSans',
      fontSize: 14,
      color: Colors.black,
    );
    final valueStyle = const TextStyle(
      fontFamily: 'RedditSans',
      fontSize: 13,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    );

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
          "About App",
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
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Basic App Information
              const Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Text(
                  "1. Basic App Information",
                  style: TextStyle(
                    fontFamily: 'RedditSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              sectionCard([
                Row(
                  children: [
                    Text("• App Name: ", style: labelStyle),
                    Text("NEED", style: valueStyle),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text("• App Version: ", style: labelStyle),
                    Text("v1.0.0", style: valueStyle),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text("• Build: ", style: labelStyle),
                    Text("3567", style: valueStyle),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text("• Last Updated: ", style: labelStyle),
                    Text("August 15, 2025", style: valueStyle),
                  ],
                ),
              ]),

              // 2. Developer
              const Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Text(
                  "2. Developer",
                  style: TextStyle(
                    fontFamily: 'RedditSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              sectionCard([
                Row(
                  children: [
                    Text("• By: ", style: labelStyle),
                    Text("Coding Playground Technologies", style: valueStyle),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text("• Contact: ", style: labelStyle),
                    Text("codingplayground@gmail.com", style: valueStyle),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("• Links: ", style: labelStyle),
                    Flexible(
                      child: Text(
                        "Privacy policy & Terms of use",
                        style: valueStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ]),

              // 3. Features
              const Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Text(
                  "3. Features",
                  style: TextStyle(
                    fontFamily: 'RedditSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              sectionCard([
                Row(
                  children: [
                    Text("• App Name: ", style: labelStyle),
                    Text("NEED", style: valueStyle),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text("• App Version: ", style: labelStyle),
                    Text("v1.0.0", style: valueStyle),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text("• Build: ", style: labelStyle),
                    Text("3567", style: valueStyle),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text("• Last Updated: ", style: labelStyle),
                    Text("August 15, 2025", style: valueStyle),
                  ],
                ),
              ]),

              // 4. Legal
              const Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Text(
                  "4. Legal",
                  style: TextStyle(
                    fontFamily: 'RedditSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              sectionCard([
                Row(
                  children: [
                    Text("• Permissions: ", style: labelStyle),
                    Text("Camera, Notifications", style: valueStyle),
                  ],
                ),
                const SizedBox(height: 4),
                Row(children: [Text("• Licence: ", style: labelStyle)]),
              ]),

              // 5. Actions
              const Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Text(
                  "4. Actions",
                  style: TextStyle(
                    fontFamily: 'RedditSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              sectionCard([
                Text("• Update: App up-to-date", style: labelStyle),
                const SizedBox(height: 4),
                Text("• Rate: Rate on App Store", style: labelStyle),
                const SizedBox(height: 4),
                Text("• Share: Invite Friends", style: labelStyle),
              ]),
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
