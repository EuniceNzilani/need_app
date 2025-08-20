import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'what do you need/need_screen.dart'; // Use the correct class name NeedScreen
import 'import from china/import1.dart'; // Use the correct class name Import1
import 'expert profiles/services_available.dart';
import 'import from china/track_request.dart';

// SVGs as constants for quick access buttons
const String expertAvailableSvg = '''
<svg height="512" viewBox="0 0 512 512" width="512" xmlns="http://www.w3.org/2000/svg"><title/><path d="M332.64,64.58C313.18,43.57,286,32,256,32c-30.16,0-57.43,11.5-76.8,32.38-19.58,21.11-29.12,49.8-26.88,80.78C156.76,206.28,203.27,256,256,256s99.16-49.71,103.67-110.82C361.94,114.48,352.34,85.85,332.64,64.58Z"/><path d="M432,480H80A31,31,0,0,1,55.8,468.87c-6.5-7.77-9.12-18.38-7.18-29.11C57.06,392.94,83.4,353.61,124.8,326c36.78-24.51,83.37-38,131.2-38s94.42,13.5,131.2,38c41.4,27.6,67.74,66.93,76.18,113.75,1.94,10.73-.68,21.34-7.18,29.11A31,31,0,0,1,432,480Z"/></svg>
''';

const String trackImportSvg = '''
<svg viewBox="0 0 96 96" xmlns="http://www.w3.org/2000/svg"><title/><g><path d="M90,42H83.3936A35.9331,35.9331,0,0,0,54,12.6064V6A6,6,0,0,0,42,6v6.6064A35.9331,35.9331,0,0,0,12.6064,42H6A6,6,0,0,0,6,54h6.6064A35.9331,35.9331,0,0,0,42,83.3936V90a6,6,0,0,0,12,0V83.3936A35.9331,35.9331,0,0,0,83.3936,54H90a6,6,0,0,0,0-12ZM48,72A24,24,0,1,1,72,48,24.0238,24.0238,0,0,1,48,72Z"/><path d="M48,36A12,12,0,1,0,60,48,12.0157,12.0157,0,0,0,48,36Z"/></g></svg>
''';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.location_on, color: Colors.black, size: 20),
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
              onPressed: () {
                // Implement Edit Location navigation here if needed
              },
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
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              const Text(
                'What do you NEED today?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'Reddit Sans',
                ),
              ),
              const SizedBox(height: 12),
              // Request Service Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF14A388), Color(0xFF073D33)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'There are variety of services\nthat we offer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                              fontFamily: 'Reddit Sans',
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NeedScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              textStyle: const TextStyle(
                                fontFamily: 'Reddit Sans',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            child: const Text(
                              'Request Service',
                              style: TextStyle(color: Color(0xFF14A388)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(51), // 0.2 * 255 = 51
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'Assets/home image1.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.people,
                              color: Colors.white,
                              size: 40,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Order Goods from China',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'Reddit Sans',
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Import1()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withAlpha(25), // 0.1 * 255 = 25
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Import goods and services\nfrom China',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.3,
                                fontFamily: 'Reddit Sans',
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: 110,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withAlpha(51), // 0.2*255
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Import1(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  elevation: 0,
                                  side: const BorderSide(
                                    color: Color(0xFFF1F1F1),
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  textStyle: const TextStyle(
                                    fontFamily: 'Reddit Sans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                child: const Text('Import'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        width: 100,
                        height: 92,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'Assets/import image.jpeg',
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF23B09B).withAlpha(25),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.local_shipping,
                                  color: Color(0xFF23B09B),
                                  size: 30,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Quick Access',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'Reddit Sans',
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  // Expert Available
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ServicesAvailable(),
                          ),
                        );
                      },
                      child: Container(
                        width: 105,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha(23), // 0.09*255=23
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 30,
                                  height: 30,
                                  child: SvgPicture.string(
                                    expertAvailableSvg,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.black,
                                      BlendMode.srcIn,
                                    ),
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Expert available',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Reddit Sans',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Track Import
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TrackRequestScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 105,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(23),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 30,
                            height: 30,
                            child: SvgPicture.string(
                              trackImportSvg,
                              colorFilter: const ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcIn,
                              ),
                              width: 20,
                              height: 20,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Track Import',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: 'Reddit Sans',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _CustomBottomNav(currentIndex: 0),
    );
  }
}

// Simple custom bottom nav for your screen
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
      },
    );
  }
}
