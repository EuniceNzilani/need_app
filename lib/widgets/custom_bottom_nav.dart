import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/ai/ai_help_centre.dart';
import '../screens/account/my_profile.dart';

/// Bottom navigation bar widget.
class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const selectedColor = Color(0xFF14A388);
    const unselectedColor = Colors.black;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // Shadow removed - no boxShadow property
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) {
          // Handle navigation based on the tapped index
          switch (index) {
            case 0:
              // Navigate to Home
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
              break;
            case 1:
              // Navigate to AI Support
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AiHelpCentreScreen()),
              );
              break;
            case 2:
              // Navigate to Account
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyProfileScreen()),
              );
              break;
          }
          // Also call the original onTap callback
          onTap(index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        elevation: 0, // Remove shadow from BottomNavigationBar as well
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent), // Changed to support_agent icon
            activeIcon: Icon(Icons.support_agent),
            label: 'AI Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
