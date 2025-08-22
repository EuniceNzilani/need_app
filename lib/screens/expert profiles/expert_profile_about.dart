import 'package:flutter/material.dart';
import '../home.dart';
import '../ai/ai_help_centre.dart';
import '../account/my_profile.dart';
import 'services_available.dart';
import 'reviews.dart';
import '../negotiation/negotiation_chat.dart';
import '../negotiation/service_summary.dart';

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
    // All icons black as requested
    const selectedColor = Colors.black;
    const unselectedColor = Colors.black;

    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AiHelpCentreScreen(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyProfileScreen(),
                ),
              );
              break;
          }
          onTap(index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
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

class ExpertProfileAbout extends StatefulWidget {
  const ExpertProfileAbout({super.key});

  @override
  State<ExpertProfileAbout> createState() => _ExpertProfileAboutState();
}

class _ExpertProfileAboutState extends State<ExpertProfileAbout>
    with SingleTickerProviderStateMixin {
  int _currentTab = 2; // Review as default for screenshot demonstration
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentTab);
  }

  void _onTab(int index) {
    if (_currentTab == index) return;
    setState(() {
      _currentTab = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 220),
      curve: Curves.ease,
    );
  }

  void _onNavTap(int index) {}

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildStatsCard(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              fontFamily: 'Reddit Sans',
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              fontFamily: 'Reddit Sans',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const String mapImage = "Assets/map image.png";
    const String profileImage = "Assets/friday chukwu image.jpg";
    const Color greenColor = Color(0xFF23B09B);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                mapImage,
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 13,
                left: 6,
                child: IconButton(
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 26,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ServicesAvailable(),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: -32,
                left: 0,
                right: 0,
                child: Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 34,
                          backgroundImage: AssetImage(profileImage),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 44),
          // Stats first row (no border)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                _buildStatsCard("Total Jobs", "10"),
                _buildStatsCard("Ratings", "5/5"),
                _buildStatsCard("Distance", "<5km"),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Friday Chukwu",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
              fontFamily: 'Reddit Sans',
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "+234 805 578 9354",
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Reddit Sans',
              color: Colors.black.withOpacity(0.65),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                5,
                (i) =>
                    const Icon(Icons.star, color: Color(0xFFFFB800), size: 13),
              ),
            ],
          ),
          // Available below the stars
          const SizedBox(height: 3),
          Text(
            "Available",
            style: TextStyle(
              color: greenColor,
              fontWeight: FontWeight.w600,
              fontSize: 11,
              fontFamily: 'Reddit Sans',
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TabButton(
                  label: "About",
                  selected: _currentTab == 0,
                  onTap: () => _onTab(0),
                ),
                _TabButton(
                  label: "Jobs",
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
          const SizedBox(height: 10),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // About Section (unchanged)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.09),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bio",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                fontFamily: 'Reddit Sans',
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "A dedicated and hardworking individual with a passion for agriculture and a proven track record in farm operations. Possessing 5 years of experience in planting, cultivating, and harvesting a variety of crops, including fruits and vegetables.",
                              style: TextStyle(
                                fontSize: 11.5,
                                fontFamily: 'Reddit Sans',
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 2),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.09),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Skills",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                fontFamily: 'Reddit Sans',
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              "Generator Repair",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Reddit Sans',
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Vulcanizer",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Reddit Sans',
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Vehicle Service",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Reddit Sans',
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Jobs Section
                const _JobsTabContent(),
                // Review Section
                const _ReviewTabContent(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 0, 11, 7),
            child: Row(
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                    ),
                    child: const Text(
                      "Start Chat",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Reddit Sans',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                    ),
                    child: const Text(
                      "Accept Expert",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Reddit Sans',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: 0, onTap: _onNavTap),
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
                fontSize: 14,
                fontFamily: 'Reddit Sans',
              ),
            ),
            const SizedBox(height: 2),
            if (selected)
              Container(
                width: 18,
                height: 2,
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

class _JobsTabContent extends StatelessWidget {
  const _JobsTabContent();
  @override
  Widget build(BuildContext context) {
    List<String> jobImages = List.generate(6, (i) => "Assets/flowerneed.jpg");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 3.0, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Previous Jobs",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  fontFamily: 'Reddit Sans',
                ),
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: jobImages.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder:
                (context, idx) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(jobImages[idx], fit: BoxFit.cover),
                ),
          ),
        ],
      ),
    );
  }
}

class _ReviewTabContent extends StatelessWidget {
  const _ReviewTabContent();
  @override
  Widget build(BuildContext context) {
    // Use friday chukwu image for all avatars in review as requested
    const String profileImage = "Assets/friday chukwu image.jpg";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 0, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  blurRadius: 13,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and See more
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Reviews",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          fontFamily: 'Reddit Sans',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ExpertReviewsScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "See more",
                          style: TextStyle(
                            color: Color(0xFF23B09B),
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            fontFamily: 'Reddit Sans',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const _ReviewRow(
                    image: profileImage,
                    name: "Musa Muhammed",
                    review: "Excellent Work delivered!!",
                    stars: 5,
                  ),
                  const SizedBox(height: 5),
                  const _ReviewRow(
                    image: profileImage,
                    name: "Mariam Olamide",
                    review: "Very punctual and honest",
                    stars: 5,
                  ),
                  const SizedBox(height: 5),
                  const _ReviewRow(
                    image: profileImage,
                    name: "Joshua David",
                    review: "Excellent!",
                    stars: 5,
                  ),
                  const SizedBox(height: 5),
                  const _ReviewRow(
                    image: profileImage,
                    name: "Victor James",
                    review: "Good job done!",
                    stars: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  final String image;
  final String name;
  final String review;
  final int stars;

  const _ReviewRow({
    required this.image,
    required this.name,
    required this.review,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // User image
        CircleAvatar(radius: 18, backgroundImage: AssetImage(image)),
        const SizedBox(width: 10),
        // Name and review
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.5,
                  fontFamily: 'Reddit Sans',
                ),
              ),
              Text(
                review,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 11,
                  fontFamily: 'Reddit Sans',
                ),
              ),
            ],
          ),
        ),
        // Stars (now gold/yellow as requested)
        Row(
          children: List.generate(
            5,
            (i) => const Icon(
              Icons.star,
              color: Color(0xFFFFB800), // Gold/yellow
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
