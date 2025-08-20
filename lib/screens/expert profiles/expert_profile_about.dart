import 'package:flutter/material.dart';
import '../../home.dart';
import '../negotiation/negotiation_chat.dart';
import '../negotiation/service_summary.dart';
import 'expert_profile_jobs.dart';
import 'expert_profile_review.dart';

// --- Bottom Nav Widget ---
class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const selectedColor = Color(0xFF14A388);
    const unselectedColor = Colors.black;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) => onTap(index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy_outlined),
            activeIcon: Icon(Icons.smart_toy_rounded),
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

class ExpertProfileAbout extends StatefulWidget {
  const ExpertProfileAbout({super.key});

  @override
  State<ExpertProfileAbout> createState() => _ExpertProfileAboutState();
}

class _ExpertProfileAboutState extends State<ExpertProfileAbout> {
  int _currentTab = 0; // 0 = About, 1 = Photos, 2 = Review

  void _onTab(int index) {
    if (_currentTab == index) return;
    switch (index) {
      case 0:
        // Do nothing, already here
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ExpertProfileJobs()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ExpertProfileReview()),
        );
        break;
    }
  }

  void _onNavTap(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Home()),
      );
    }
    // Add more navigation logic for AI Support or Account here if needed.
  }

  @override
  Widget build(BuildContext context) {
    const String mapImage = "Assets/map image.png";
    const Color greenColor = Color(0xFF23B09B);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed:
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Home()),
              ),
        ),
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ojo Lagos Post...',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft,
                textStyle: const TextStyle(decoration: TextDecoration.none),
              ),
              child: const Text(
                'Edit Location',
                style: TextStyle(
                  color: Color(0xFF23B09B),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Reddit Sans',
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 6, top: 8),
            child: const Icon(
              Icons.group_outlined,
              color: Colors.black,
              size: 22,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 14, top: 8),
            child: const Icon(
              Icons.settings_outlined,
              color: Colors.black,
              size: 22,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                mapImage,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: -40,
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 44,
                    backgroundImage: const NetworkImage(
                      "https://randomuser.me/api/portraits/men/32.jpg",
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Column(
            children: [
              const Text(
                "Friday Chukwu",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Reddit Sans',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                "+234 805 578 9354",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Reddit Sans',
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Available",
                    style: TextStyle(
                      color: greenColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      fontFamily: 'Reddit Sans',
                    ),
                  ),
                  const SizedBox(width: 5),
                  ...List.generate(
                    5,
                    (i) => const Icon(
                      Icons.star,
                      color: Color(0xFFFFB800),
                      size: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: const [
                Expanded(child: _StatCard(label: "Total Jobs", value: "10")),
                SizedBox(width: 8),
                Expanded(child: _StatCard(label: "Ratings", value: "5/5")),
                SizedBox(width: 8),
                Expanded(child: _StatCard(label: "Distance", value: "<5km")),
              ],
            ),
          ),
          const SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TabButton(
                  label: "About",
                  selected: _currentTab == 0,
                  onTap: () => _onTab(0),
                ),
                _TabButton(
                  label: "Photos",
                  selected: _currentTab == 1,
                  onTap: () => _onTab(1),
                ),
                _TabButton(
                  label: "Review",
                  selected: _currentTab == 2,
                  onTap: () => _onTab(2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              children: [
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bio",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'Reddit Sans',
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "A dedicated and hardworking individual with a passion for agriculture and a proven track record in farm operations. Possessing 5 years of experience in planting, cultivating, and harvesting a variety of crops, including fruits and vegetables.",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Reddit Sans',
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.only(bottom: 16),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Skills",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'Reddit Sans',
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Generator Repair\nVulcanizer\nVehicle Service",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Reddit Sans',
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NegotiationChatScreen(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: greenColor,
                          side: const BorderSide(color: greenColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          "Start Chat",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Reddit Sans',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ServiceSummaryScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          "Accept Expert",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Reddit Sans',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: 0, onTap: _onNavTap),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FA),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 12.5, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _TabButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: selected ? const Color(0xFF23B09B) : Colors.black87,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                fontSize: 15.5,
                fontFamily: 'Reddit Sans',
              ),
            ),
            const SizedBox(height: 2),
            if (selected)
              Container(
                width: 24,
                height: 2.5,
                decoration: BoxDecoration(
                  color: const Color(0xFF23B09B),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
