import 'package:flutter/material.dart';
import '../../widgets/custom_top_nav.dart';
import '../../widgets/custom_bottom_nav.dart' as nav;
import 'expert_profile_about.dart';

class ServicesAvailable extends StatefulWidget {
  const ServicesAvailable({super.key});

  @override
  State<ServicesAvailable> createState() => _ServicesAvailableState();
}

class _ServicesAvailableState extends State<ServicesAvailable> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Color greenColor = const Color(0xFF23B09B);

    // Use local asset for all images
    final String localImage = 'Assets/friday chukwu image.jpg';

    // All experts (6 in total)
    final List<Map<String, dynamic>> experts = [
      {
        "name": "Friday Chuckwu",
        "avatar": localImage,
        "distance": "Closer to you",
        "stars": 3,
        "online": true,
      },
      {
        "name": "James Vitalik",
        "avatar": localImage,
        "distance": "Closer to you",
        "stars": 2,
        "online": true,
      },
      {
        "name": "Hansem Godwin",
        "avatar": localImage,
        "distance": "<5km to you",
        "stars": 5,
        "online": true,
      },
      {
        "name": "Victor Chibuzo",
        "avatar": localImage,
        "distance": "<7km to you",
        "stars": 2,
        "online": true,
      },
      {
        "name": "Joshua Bolanle",
        "avatar": localImage,
        "distance": "10km to you",
        "stars": 5,
        "online": true,
      },
      {
        "name": "David Kola",
        "avatar": localImage,
        "distance": ">10km to you",
        "stars": 4,
        "online": false,
      },
    ];

    // Calculate dynamic heights to fit 6 experts in a single screen
    final double appBarHeight = kToolbarHeight + 12;
    final double availableHeight =
        MediaQuery.of(context).size.height -
        appBarHeight -
        MediaQuery.of(context).padding.top -
        70; // 70 for bottom nav
    final double cardHeight =
        (availableHeight - 50) / experts.length; // 50 is for paddings/spacer

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomTopNav(
        title: '',
        showEditLocation: true,
        showNotifications: true,
        showSettings: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Generator Repair Service Available',
                style: TextStyle(
                  fontFamily: 'Reddit Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 6),
            ...experts.map(
              (expert) => SizedBox(
                height:
                    cardHeight > 85
                        ? 85
                        : cardHeight, // cap max card height for aesthetics
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x11000000),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: const Color(0xFFE4F7F3),
                            backgroundImage: AssetImage(expert["avatar"]),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color:
                                    expert["online"] ? greenColor : Colors.red,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.2,
                                ),
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
                                fontSize: 13,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (expert["distance"] != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                expert["distance"],
                                style: const TextStyle(
                                  fontFamily: 'Reddit Sans',
                                  fontSize: 10.5,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Row(
                          children: List.generate(5, (i) {
                            if (i < expert["stars"]) {
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
                      ),
                      trailing: SizedBox(
                        width: 68,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ExpertProfileAbout(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greenColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 0,
                            ),
                            elevation: 0,
                            textStyle: const TextStyle(
                              fontFamily: 'Reddit Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                            ),
                          ),
                          child: const Text(
                            'View',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: nav.CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
