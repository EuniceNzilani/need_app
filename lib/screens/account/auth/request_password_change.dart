import 'package:flutter/material.dart';

class RequestPasswordChangeScreen extends StatefulWidget {
  const RequestPasswordChangeScreen({Key? key}) : super(key: key);

  @override
  State<RequestPasswordChangeScreen> createState() =>
      _RequestPasswordChangeScreenState();
}

class _RequestPasswordChangeScreenState
    extends State<RequestPasswordChangeScreen> {
  final TextEditingController _phoneController = TextEditingController();

  void _requestPasswordChange() {
    // Implement request logic
    // You may want to validate and navigate to OTP or confirmation screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Text(
            "<",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w400,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              // SVG Icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFE7F6F3),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: CustomPaint(painter: _ChangePasswordIconPainter()),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Change Password",
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
                "Enter the phone number you used to register on NEED app, and we will send you a code to reset your password",
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
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
                  onPressed: _requestPasswordChange,
                  child: const Text(
                    "Request Password change",
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

// Custom Painter for Change Password SVG Icon
class _ChangePasswordIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // This is a simplified, representative padlock icon.
    final paint =
        Paint()
          ..color = const Color(0xFF14A388)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.6;

    // Outer circle
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2 - 2,
      ),
      0.2,
      2.7,
      false,
      paint,
    );
    // Lock body
    paint.style = PaintingStyle.fill;
    final lockBodyRect = Rect.fromLTWH(
      size.width * 0.26,
      size.height * 0.53,
      size.width * 0.48,
      size.height * 0.33,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(lockBodyRect, Radius.circular(size.width * 0.11)),
      paint,
    );
    // Lock shackle
    paint.style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromLTWH(
        size.width * 0.32,
        size.height * 0.24,
        size.width * 0.36,
        size.height * 0.42,
      ),
      3.14,
      3.14,
      false,
      paint,
    );
    // Keyhole
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.width / 2, size.height * 0.72),
      size.width * 0.045,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
