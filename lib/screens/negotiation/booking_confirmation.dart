import 'package:flutter/material.dart';
import 'service_summary.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);

    // Timeline steps data
    final steps = [
      {
        "dotColor": greenColor,
        "tickColor": Colors.black,
        "title": "Hired Expert, waiting to accept",
        "status": "Status: Pending",
        "statusColor": greenColor,
        "isBold": true,
      },
      {
        "dotColor": Colors.grey,
        "tickColor": Colors.grey,
        "title": "Expert accepted and working",
        "status": "Status: In Progress",
        "statusColor": Colors.black87,
        "isBold": false,
      },
      {
        "dotColor": Colors.grey,
        "tickColor": Colors.grey,
        "title": "Expert completed work.",
        "status": "Status: Completed",
        "statusColor": Colors.black87,
        "isBold": false,
      },
    ];

    // This controls the vertical distance between dots/texts
    const double dotSpacing = 52.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Booking Confirmation',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Reddit Sans',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black, size: 28),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ServiceSummaryScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Profile avatar and info
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage(
                      'Assets/friday chukwu image.jpg',
                    ),
                  ),
                  const SizedBox(height: 14),
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
                    "(2km away from you)",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Reddit Sans',
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Timeline/Stepper
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Vertical timeline: long dashed line behind all dots
                  SizedBox(
                    width: 23,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        // Dashed line spans all dots
                        Positioned.fill(
                          child: _FullHeightDashedLine(
                            dotCount: steps.length,
                            dotSpacing: dotSpacing,
                          ),
                        ),
                        // Dots at their respective positions
                        Column(
                          children: List.generate(steps.length, (i) {
                            return Padding(
                              padding: EdgeInsets.only(top: i * dotSpacing),
                              child: _StatusDot(
                                color: steps[i]["dotColor"] as Color,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Texts and ticks
                  Expanded(
                    child: Column(
                      children: List.generate(steps.length, (i) {
                        final step = steps[i];
                        final isLast = i == steps.length - 1;
                        return Padding(
                          // The last entry doesn't need extra bottom padding
                          padding: EdgeInsets.only(
                            top:
                                i == 0
                                    ? 0.0
                                    : dotSpacing -
                                        13.0, // 13.0 is dot height, aligns dot center to row center
                            bottom: !isLast ? 0.0 : 0.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Texts
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      step["title"] as String,
                                      style: TextStyle(
                                        fontWeight:
                                            step["isBold"] as bool
                                                ? FontWeight.w600
                                                : FontWeight.w500,
                                        fontFamily: 'Reddit Sans',
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      step["status"] as String,
                                      style: TextStyle(
                                        fontFamily: 'Reddit Sans',
                                        fontSize: 14,
                                        color: step["statusColor"] as Color,
                                        fontWeight:
                                            step["isBold"] as bool
                                                ? FontWeight.w600
                                                : FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Tick (check icon)
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 2,
                                ),
                                child: _CircleCheck(
                                  color: step["tickColor"] as Color,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusDot extends StatelessWidget {
  final Color color;
  const _StatusDot({required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13,
      height: 13,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: color, width: 2),
      ),
    );
  }
}

/// Draws a full vertical dashed line spanning all steps, regardless of dot spacing.
class _FullHeightDashedLine extends StatelessWidget {
  final int dotCount;
  final double dotSpacing;
  const _FullHeightDashedLine({
    required this.dotCount,
    required this.dotSpacing,
  });
  @override
  Widget build(BuildContext context) {
    // The full dashed line height covers the distance from the center of the first dot to the center of the last dot
    final double totalHeight =
        dotCount > 1 ? dotSpacing * (dotCount - 1) + 13.0 : 13.0;
    // 13 is the height of the dot itself
    return SizedBox(
      width: 13,
      height: totalHeight,
      child: CustomPaint(painter: _DashedLinePainter()),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey.shade300
          ..strokeWidth = 2;
    const double dashHeight = 3.0;
    const double dashSpace = 3.5;
    double startY = 0.0;
    while (startY < size.height) {
      final double endY = (startY + dashHeight).clamp(0.0, size.height);
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, endY),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _CircleCheck extends StatelessWidget {
  final Color color;
  const _CircleCheck({required this.color});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Colors.white,
      child: Icon(Icons.check_circle, color: color, size: 27),
    );
  }
}
