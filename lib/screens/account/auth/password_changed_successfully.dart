import 'package:flutter/material.dart';

class PasswordChangedSuccessfullyScreen extends StatelessWidget {
  const PasswordChangedSuccessfullyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black, size: 28),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/my_profile');
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const SizedBox(height: 44),
              // Custom Shield-Check Icon
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7F6F3),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: CustomPaint(
                        size: const Size(46, 46),
                        painter: _ShieldFillCheckPainter(),
                      ),
                    ),
                  ),
                  // Decorative dots
                  Positioned(
                    left: -8,
                    top: -13,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Color(0xFF14A388),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -10,
                    top: 18,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF14A388),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 19,
                    top: -12,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF14A388),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              const Text(
                "Password Changed\nSuccessfully!",
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Your Password has been changed successfully",
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF14A388),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/my_profile');
                  },
                  child: const Text(
                    "Back to Profile",
                    style: TextStyle(
                      fontFamily: 'RedditSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Painter for ShieldFillCheck SVG icon
class _ShieldFillCheckPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Shield
    final shieldPath =
        Path()
          ..moveTo(size.width / 2, 0)
          ..cubicTo(
            size.width * 0.43,
            0,
            size.width * 0.19,
            size.height * 0.09,
            size.width * 0.09,
            size.height * 0.15,
          )
          ..cubicTo(
            size.width * 0.01,
            size.height * 0.18,
            0,
            size.height * 0.25,
            0,
            size.height * 0.32,
          )
          ..cubicTo(
            0,
            size.height * 0.80,
            size.width * 0.26,
            size.height * 0.98,
            size.width / 2,
            size.height,
          )
          ..cubicTo(
            size.width * 0.74,
            size.height * 0.98,
            size.width,
            size.height * 0.80,
            size.width,
            size.height * 0.32,
          )
          ..cubicTo(
            size.width,
            size.height * 0.25,
            size.width * 0.99,
            size.height * 0.18,
            size.width * 0.91,
            size.height * 0.15,
          )
          ..cubicTo(
            size.width * 0.81,
            size.height * 0.09,
            size.width * 0.57,
            0,
            size.width / 2,
            0,
          )
          ..close();

    final shieldPaint =
        Paint()
          ..color = const Color(0xFF14A388)
          ..style = PaintingStyle.fill;
    canvas.drawPath(shieldPath, shieldPaint);

    // Checkmark
    final checkPaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.4
          ..strokeCap = StrokeCap.round;
    final checkStart = Offset(size.width * 0.36, size.height * 0.55);
    final checkMid = Offset(size.width * 0.48, size.height * 0.67);
    final checkEnd = Offset(size.width * 0.68, size.height * 0.39);
    canvas.drawLine(checkStart, checkMid, checkPaint);
    canvas.drawLine(checkMid, checkEnd, checkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
