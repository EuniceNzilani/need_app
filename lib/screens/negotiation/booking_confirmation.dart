import 'package:flutter/material.dart';
import 'service_summary.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);

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

    // Reduce the spacing between steps
    const double dotSpacing = 16.0;

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
              child: Column(
                children: List.generate(steps.length, (i) {
                  final step = steps[i];
                  final isLast = i == steps.length - 1;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Dot and line
                      Column(
                        children: [
                          _StatusDot(color: step["dotColor"] as Color),
                          if (!isLast)
                            _VerticalDashedLine(
                              height: dotSpacing + 25, // adjust for text height
                              color: Colors.grey.shade300,
                            ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      // Text and tick
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: isLast ? 0 : dotSpacing,
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
                                    const SizedBox(height: 1),
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
                        ),
                      ),
                    ],
                  );
                }),
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

class _VerticalDashedLine extends StatelessWidget {
  final double height;
  final Color color;
  const _VerticalDashedLine({required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 13,
      height: height,
      child: CustomPaint(painter: _DashedLinePainter(color: color)),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  _DashedLinePainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
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
