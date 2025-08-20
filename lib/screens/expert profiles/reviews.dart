import 'package:flutter/material.dart';

class ExpertReviewsScreen extends StatelessWidget {
  const ExpertReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);

    final List<Map<String, dynamic>> reviews = [
      {
        "name": "Musa Muhammed",
        "avatar": "https://randomuser.me/api/portraits/men/41.jpg",
        "comment": "Excellent Work delivered!!!",
        "stars": 5,
      },
      {
        "name": "Mariam Olamide",
        "avatar": "https://randomuser.me/api/portraits/women/44.jpg",
        "comment": "Very punctual and honest",
        "stars": 5,
      },
      {
        "name": "Joshua David",
        "avatar": "https://randomuser.me/api/portraits/men/45.jpg",
        "comment": "Excellent!",
        "stars": 5,
      },
      // The rest are Victor James with identical comments for demo
      for (int i = 0; i < 5; i++)
        {
          "name": "Victor James",
          "avatar": "https://randomuser.me/api/portraits/men/46.jpg",
          "comment": "Good job done!",
          "stars": 5,
        },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 18),
          // Profile Section
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  backgroundImage: const NetworkImage(
                    "https://randomuser.me/api/portraits/men/32.jpg",
                  ),
                ),
                const SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    const SizedBox(width: 5),
                    Icon(Icons.verified, color: greenColor, size: 18),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  "+234 805 578 9354",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Reddit Sans',
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
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
                    const SizedBox(width: 6),
                    ...List.generate(
                      5,
                      (_) => const Icon(
                        Icons.star,
                        color: Color(0xFFFFB800),
                        size: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 17),
          // Quick Stats
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
          const SizedBox(height: 18),
          // Reviews
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              children: [
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18.0,
                      horizontal: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Reviews",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'Reddit Sans',
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...reviews.map(
                          (review) => Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 21,
                                  backgroundColor: const Color(0xFFE4F7F3),
                                  backgroundImage: NetworkImage(
                                    review["avatar"],
                                  ),
                                ),
                                const SizedBox(width: 11),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              review["name"],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Reddit Sans',
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Row(
                                            children: List.generate(5, (i) {
                                              if (i < review["stars"])
                                                return const Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Color(0xFFFFB800),
                                                );
                                              else
                                                return const Icon(
                                                  Icons.star_border,
                                                  size: 15,
                                                  color: Color(0xFFD3D6DA),
                                                );
                                            }),
                                          ),
                                        ],
                                      ),
                                      if ((review["comment"] as String)
                                          .isNotEmpty)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 2.0,
                                          ),
                                          child: Text(
                                            review["comment"],
                                            style: const TextStyle(
                                              fontFamily: 'Reddit Sans',
                                              fontSize: 13.5,
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
          ),
        ],
      ),
      bottomNavigationBar: const _CustomBottomNav(currentIndex: 0),
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

class _CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  const _CustomBottomNav({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: greenColor,
      unselectedItemColor: Colors.black,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.wifi_tethering),
          label: 'AI Support',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Account',
        ),
      ],
      onTap: (index) {
        // Only implement navigation if you have the screens.
        // For demo, no navigation.
      },
    );
  }
}
