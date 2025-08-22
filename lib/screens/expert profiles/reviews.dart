import 'package:flutter/material.dart';
import '../home.dart';
import '../ai/ai_help_centre.dart';
import '../account/my_profile.dart';
import 'expert_profile_about.dart';

class ExpertReviewsScreen extends StatelessWidget {
  const ExpertReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);
    const String profileImage = "Assets/friday chukwu image.jpg";

    final List<Map<String, dynamic>> reviews = [
      {
        "name": "Musa Muhammed",
        "avatar": profileImage,
        "comment": "Excellent Work delivered!!!",
        "stars": 5,
      },
      {
        "name": "Mariam Olamide",
        "avatar": profileImage,
        "comment": "Very punctual and honest",
        "stars": 5,
      },
      {
        "name": "Joshua David",
        "avatar": profileImage,
        "comment": "Excellent!",
        "stars": 5,
      },
      {
        "name": "Victor James",
        "avatar": profileImage,
        "comment": "Good job done!",
        "stars": 5,
      },
      {
        "name": "Blessing Okoro",
        "avatar": profileImage,
        "comment": "Quick response and professional.",
        "stars": 5,
      },
      {
        "name": "Emeka Uzo",
        "avatar": profileImage,
        "comment": "Very helpful and friendly.",
        "stars": 5,
      },
      {
        "name": "Aisha Bello",
        "avatar": profileImage,
        "comment": "Highly recommended!",
        "stars": 5,
      },
      {
        "name": "John Smith",
        "avatar": profileImage,
        "comment": "Efficient and knowledgeable.",
        "stars": 5,
      },
      {
        "name": "Grace Nwosu",
        "avatar": profileImage,
        "comment": "Great work, will hire again.",
        "stars": 5,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Top left back arrow
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 28,
              ),
              padding: const EdgeInsets.only(left: 5),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ExpertProfileAbout()),
                );
              },
            ),
          ),
          // Profile Section
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 34,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(profileImage),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Friday Chukwu",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        fontFamily: 'Reddit Sans',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(Icons.verified, color: greenColor, size: 16),
                  ],
                ),
                const SizedBox(height: 2),
                const Text(
                  "+234 805 578 9354",
                  style: TextStyle(
                    fontSize: 11.5,
                    fontFamily: 'Reddit Sans',
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 3),
                // Stars row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      5,
                      (_) => const Icon(
                        Icons.star,
                        color: Color(0xFFFFB800),
                        size: 13,
                      ),
                    ),
                  ],
                ),
                // Available directly below the stars
                const SizedBox(height: 2),
                Text(
                  "Available",
                  style: TextStyle(
                    color: greenColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 10.5,
                    fontFamily: 'Reddit Sans',
                  ),
                ),
                const SizedBox(height: 8),
                // Stats row BELOW the profile
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: _StatCard(label: "Total Jobs", value: "10"),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: _StatCard(label: "Ratings", value: "5/5"),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: _StatCard(label: "Distance", value: "<5km"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Reviews (single card with shadow, no background)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 13,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Text(
                    "Reviews",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                      fontFamily: 'Reddit Sans',
                    ),
                  ),
                  const SizedBox(height: 6),
                  ...reviews.map(
                    (review) => Padding(
                      padding: const EdgeInsets.only(bottom: 7.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 14.5,
                            backgroundColor: const Color(0xFFE4F7F3),
                            backgroundImage: AssetImage(review["avatar"]),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        review["name"],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Reddit Sans',
                                          fontSize: 12.5,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: List.generate(5, (i) {
                                        if (i < review["stars"]) {
                                          return const Icon(
                                            Icons.star,
                                            size: 12,
                                            color: Color(0xFFFFB800),
                                          );
                                        } else {
                                          return const Icon(
                                            Icons.star_border,
                                            size: 12,
                                            color: Color(0xFFD3D6DA),
                                          );
                                        }
                                      }),
                                    ),
                                  ],
                                ),
                                if ((review["comment"] as String).isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 1.0),
                                    child: Text(
                                      review["comment"],
                                      style: const TextStyle(
                                        fontFamily: 'Reddit Sans',
                                        fontSize: 10.5,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 0,
        onTap: (index) {
          // Navigation handled in CustomBottomNav below
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 10.5,
            fontFamily: 'Reddit Sans',
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 1.5),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
            fontFamily: 'Reddit Sans',
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

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
