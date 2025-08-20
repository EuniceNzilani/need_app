import 'package:flutter/material.dart';
import '../home.dart';

class ServicesAvailable extends StatelessWidget {
  const ServicesAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    final Color greenColor = const Color(0xFF23B09B);

    // Dummy data for available experts
    final List<Map<String, dynamic>> experts = [
      {
        "name": "Friday Chuckwu",
        "avatar": "https://randomuser.me/api/portraits/men/32.jpg",
        "distance": "Closer to you",
        "stars": 3,
        "online": true,
      },
      {
        "name": "James Vitalik",
        "avatar": "https://randomuser.me/api/portraits/men/33.jpg",
        "distance": "Closer to you",
        "stars": 2,
        "online": true,
      },
      {
        "name": "Hansem Godwin",
        "avatar": "https://randomuser.me/api/portraits/men/34.jpg",
        "distance": "<5km to you",
        "stars": 5,
        "online": true,
      },
      {
        "name": "Victor Chibuzo",
        "avatar": "https://randomuser.me/api/portraits/men/35.jpg",
        "distance": "<7km to you",
        "stars": 2,
        "online": true,
      },
      {
        "name": "Joshua Bolanle",
        "avatar": "https://randomuser.me/api/portraits/men/36.jpg",
        "distance": "10km to you",
        "stars": 5,
        "online": true,
      },
      {
        "name": "David Kola",
        "avatar": "https://randomuser.me/api/portraits/men/37.jpg",
        "distance": ">10km to you",
        "stars": 4,
        "online": false,
      },
    ];

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 18),
            const Text(
              'Generator Repair Service Available',
              style: TextStyle(
                fontFamily: 'Reddit Sans',
                fontWeight: FontWeight.w600,
                fontSize: 17.5,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 14),
            ...experts.map(
              (expert) => Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x11000000),
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: const Color(0xFFE4F7F3),
                          backgroundImage: NetworkImage(expert["avatar"]),
                        ),
                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: Container(
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                              color: expert["online"] ? greenColor : Colors.red,
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            expert["name"],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Reddit Sans',
                              fontSize: 15.5,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (expert["distance"] != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              expert["distance"],
                              style: const TextStyle(
                                fontFamily: 'Reddit Sans',
                                fontSize: 12.5,
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Row(
                        children: List.generate(5, (i) {
                          if (i < expert["stars"])
                            return const Icon(
                              Icons.star,
                              size: 17,
                              color: Color(0xFFFFB800),
                            );
                          else
                            return const Icon(
                              Icons.star_border,
                              size: 17,
                              color: Color(0xFFD3D6DA),
                            );
                        }),
                      ),
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement View Profile navigation here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 6,
                          ),
                          elevation: 0,
                          textStyle: const TextStyle(
                            fontFamily: 'Reddit Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        child: const Text(
                          'View Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const _CustomBottomNav(currentIndex: 0),
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
        if (index == currentIndex) return;
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const Home()),
            );
            break;
          // Implement other cases as needed
        }
      },
    );
  }
}
