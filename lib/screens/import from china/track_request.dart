import 'package:flutter/material.dart';
import '../home.dart';
import '../account/my_profile.dart';
import '../account/notifications.dart';

class TrackRequest extends StatelessWidget {
  const TrackRequest({super.key});

  @override
  Widget build(BuildContext context) {
    final greenColor = const Color(0xFF23B09B);
    const greyCircle = Color(0xFFD0D4D8);
    const double scale = 0.9;

    final List<_StepData> steps = [
      _StepData(
        icon: Icons.call,
        title: 'Pending Contact',
        description: 'An agent will contact you shortly for the next steps',
        status: StepStatus.active,
      ),
      _StepData(
        icon: Icons.handshake_outlined,
        title: 'Negotiating',
        description: 'Negotiating with the importation agent successful!',
        status: StepStatus.inactive,
      ),
      _StepData(
        icon: Icons.credit_card_outlined,
        title: 'Awaiting Payment',
        description: 'Process your payment to validate the importation.',
        status: StepStatus.inactive,
      ),
      _StepData(
        icon: Icons.shopping_cart_outlined,
        title: 'Sourcing',
        description: 'Your goods is being sourced from china',
        status: StepStatus.inactive,
      ),
      _StepData(
        icon: Icons.airport_shuttle_outlined,
        title: 'In-Transit',
        description: 'Your goods is on their way to you',
        status: StepStatus.inactive,
      ),
      _StepData(
        icon: Icons.verified_outlined,
        title: 'Delivered',
        description: 'Your goods has been delivered successfully',
        status: StepStatus.inactive,
      ),
    ];

    void pushReplacementNoAnimation(Widget page) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          width: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- LIFTED TOP BAR TO SCREEN EDGE ---
                Padding(
                  padding: EdgeInsets.only(top: 12 * scale, bottom: 21 * scale),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 22 * scale,
                                ),
                                SizedBox(width: 6 * scale),
                                Text(
                                  'Ojo Lagos Post...',
                                  style: TextStyle(
                                    fontFamily: 'Reddit Sans',
                                    fontSize: 17.5 * scale,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const MyProfileScreen(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 28 * scale),
                                child: Text(
                                  'Edit Location',
                                  style: TextStyle(
                                    fontFamily: 'Reddit Sans',
                                    color: greenColor,
                                    fontSize: 13 * scale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              pushReplacementNoAnimation(
                                const NotificationsScreen(),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0x3314A388),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(8 * scale),
                              child: Icon(
                                Icons.notifications_none,
                                color: Colors.black,
                                size: 19 * scale,
                              ),
                            ),
                          ),
                          SizedBox(width: 11 * scale),
                          GestureDetector(
                            onTap: () {
                              pushReplacementNoAnimation(
                                const MyProfileScreen(),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0x3314A388),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(8 * scale),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 19 * scale,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Title and subtitle
                Text(
                  'My Import Request',
                  style: TextStyle(
                    fontFamily: 'Reddit Sans',
                    color: Colors.black,
                    fontSize: 18 * scale,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6 * scale),
                Text(
                  'You can track your import requests here and keep updates',
                  style: TextStyle(
                    fontFamily: 'Reddit Sans',
                    color: Colors.black87,
                    fontSize: 12.5 * scale,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 24 * scale),

                // Date and tracking ID
                Text(
                  'Thursday 17 2025',
                  style: TextStyle(
                    fontFamily: 'Reddit Sans',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15 * scale,
                  ),
                ),
                SizedBox(height: 4 * scale),
                Text(
                  'Tracking ID: YUE-4B7-U8H',
                  style: TextStyle(
                    fontFamily: 'Reddit Sans',
                    color: Colors.black87,
                    fontSize: 13 * scale,
                  ),
                ),
                SizedBox(height: 30 * scale),

                // Steps with vertical dashed line and circles
                _TimelineSteps(
                  steps: steps,
                  greenColor: greenColor,
                  greyCircle: greyCircle,
                  scale: scale,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
    );
  }
}

class _TimelineSteps extends StatelessWidget {
  final List<_StepData> steps;
  final Color greenColor;
  final Color greyCircle;
  final double scale;
  const _TimelineSteps({
    required this.steps,
    required this.greenColor,
    required this.greyCircle,
    required this.scale,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: steps.length,
      itemBuilder: (context, i) {
        final isLast = i == steps.length - 1;
        final step = steps[i];
        final bool isActive = step.status == StepStatus.active;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline
            Padding(
              padding: EdgeInsets.only(top: 2 * scale),
              child: Column(
                children: [
                  // Circle
                  Container(
                    width: 16 * scale,
                    height: 16 * scale,
                    decoration: BoxDecoration(
                      color: isActive ? greenColor : greyCircle,
                      border: Border.all(
                        color: isActive ? greenColor : greyCircle,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Dashed line
                  if (!isLast)
                    _DashedLine(
                      color: greenColor.withAlpha((0.21 * 255).round()),
                      height: 38 * scale,
                      dashWidth: 2,
                      dashHeight: 6,
                    ),
                ],
              ),
            ),
            SizedBox(width: 17 * scale),
            // Step icon and text (all icons green)
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Icon(step.icon, size: 17 * scale, color: greenColor),
            ),
            SizedBox(width: 12 * scale),
            // Step texts
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: isLast ? 0 : 18 * scale),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.title,
                      style: TextStyle(
                        fontFamily: 'Reddit Sans',
                        fontSize: 15 * scale,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2 * scale),
                    Text(
                      step.description,
                      style: TextStyle(
                        fontSize: 12.5 * scale,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DashedLine extends StatelessWidget {
  final Color color;
  final double height;
  final double dashWidth;
  final double dashHeight;
  const _DashedLine({
    required this.color,
    required this.height,
    this.dashWidth = 2,
    this.dashHeight = 6,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dashCount =
              (constraints.maxHeight / (dashHeight * 1.7)).floor();
          return Column(
            children: List.generate(dashCount, (index) {
              return Container(
                width: dashWidth,
                height: dashHeight,
                color: color,
                margin: EdgeInsets.only(bottom: dashHeight / 1.7),
              );
            }),
          );
        },
      ),
    );
  }
}

enum StepStatus { active, inactive }

class _StepData {
  final IconData icon;
  final String title;
  final String description;
  final StepStatus status;

  _StepData({
    required this.icon,
    required this.title,
    required this.description,
    this.status = StepStatus.inactive,
  });
}

// --- Custom Bottom Navigation ---
class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final double scale;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    this.scale = 0.9,
  });

  @override
  Widget build(BuildContext context) {
    const greenColor = Color(0xFF23B09B);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: greenColor,
      unselectedItemColor: Colors.black,
      currentIndex: currentIndex,
      iconSize: 22 * scale,
      selectedFontSize: 14 * scale,
      unselectedFontSize: 13 * scale,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: currentIndex == 0 ? greenColor : Colors.black,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.support_agent,
            color: currentIndex == 1 ? greenColor : Colors.black,
          ),
          label: 'AI Support',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: currentIndex == 2 ? greenColor : Colors.black,
          ),
          label: 'Account',
        ),
      ],
      onTap: (index) => _onItemTapped(context, index),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;
    void pushReplacementNoAnimation(Widget page) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => page,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    }

    switch (index) {
      case 0:
        pushReplacementNoAnimation(const Home());
        break;
      case 1:
        pushReplacementNoAnimation(const NotificationsScreen());
        break;
      case 2:
        pushReplacementNoAnimation(const MyProfileScreen());
        break;
    }
  }
}

// Dummy screens for navigation targets you must implement in your codebase
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Notifications')));
}

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('My Profile')));
}
