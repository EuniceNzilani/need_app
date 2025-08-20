import 'package:flutter/material.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SVG Icon as Widget
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFE7F6F3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(child: _LocationSvgIcon()),
              ),
              const SizedBox(height: 32),
              const Text(
                'Allow your Location',
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Your location is needed and important to use the NEED app efficiently, you can edit it later in your settings',
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontSize: 14,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF14A388),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    shadowColor: const Color(0xFF14A388).withOpacity(0.2),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Text(
                    "Allow Location",
                    style: TextStyle(
                      fontFamily: 'RedditSans',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: .5,
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

class _LocationSvgIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The icon is hard-coded as a CustomPaint since no SVG package is allowed.
    return CustomPaint(
      size: const Size(44, 44),
      painter: _LocationIconPainter(),
    );
  }
}

class _LocationIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width, h = size.height;
    final Paint paint = Paint()..style = PaintingStyle.fill;

    // Main pin path (the simplified version of your SVG path)
    paint.color = const Color(0xFF14A388);
    Path path = Path();
    path.moveTo(w / 2, h * 0.09);
    path.cubicTo(w * 0.23, h * 0.09, w * 0.09, h * 0.36, w * 0.09, h * 0.57);
    path.cubicTo(w * 0.09, h * 0.77, w / 2, h * 0.95, w / 2, h * 0.95);
    path.cubicTo(w / 2, h * 0.95, w * 0.91, h * 0.77, w * 0.91, h * 0.57);
    path.cubicTo(w * 0.91, h * 0.36, w * 0.77, h * 0.09, w / 2, h * 0.09);
    path.close();
    canvas.drawPath(path, paint);

    // Circle
    paint.color = Colors.white;
    canvas.drawCircle(Offset(w / 2, h * 0.43), w * 0.15, paint);

    paint.color = const Color(0xFF14A388);
    canvas.drawCircle(Offset(w / 2, h * 0.43), w * 0.09, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
