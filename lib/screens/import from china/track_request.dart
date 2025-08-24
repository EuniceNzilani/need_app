import 'package:flutter/material.dart';
import '../home.dart'; // This should point to your home screen
import '../account/my_profile.dart';
import '../account/notifications.dart';
import 'import.dart'
    hide CustomBottomNav; // Hide CustomBottomNav from import.dart
import '/widgets/custom_bottom_nav.dart'
    as widgets; // Use prefix to avoid conflicts

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
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => page,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
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
                // --- TOP BAR AT SCREEN EDGE ---
                Padding(
                  padding: EdgeInsets.only(top: 12 * scale, bottom: 21 * scale),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back arrow (chevron_left)
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const Import()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 10 * scale,
                            top: 2 * scale,
                          ),
                          child: const Icon(
                            Icons.chevron_left,
                            color: Colors.black,
                            size: 32,
                          ),
                        ),
                      ),
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
                                Icons.settings,
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
      bottomNavigationBar: widgets.CustomBottomNav(
        currentIndex:
            -1, // No item selected since this is not a main nav screen
        onTap: (index) {
          // Handle any additional logic if needed
        },
      ),
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
            // Step icon and text (all icons black now)
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Icon(step.icon, size: 17 * scale, color: Colors.black),
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
