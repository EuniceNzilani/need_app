import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../sign_in_screen.dart';

class PasswordResetSuccessfullyScreen extends StatelessWidget {
  const PasswordResetSuccessfullyScreen({super.key});

  static const String _shieldCheckSvg = '''
<svg width="46" height="46" viewBox="0 0 46 46" fill="none" xmlns="http://www.w3.org/2000/svg">
  <path
    d="M23 0
      C19.78 0, 8.74 4.14, 4.14 6.9
      C0.46 8.28, 0 11.5, 0 14.72
      C0 36.8, 11.96 45.08, 23 46
      C34.04 45.08, 46 36.8, 46 14.72
      C46 11.5, 45.54 8.28, 41.86 6.9
      C37.26 4.14, 26.22 0, 23 0
      Z"
    fill="#14A388"
  />
  <path
    d="M16.56 25.3
      L22.08 30.82
      L31.28 18.02"
    stroke="#FFFFFF"
    stroke-width="2.4"
    stroke-linecap="round"
    stroke-linejoin="round"
  />
</svg>
''';

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);
    const Color iconBackgroundColor = Color(0xFFE6F7F4);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black, size: 24),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const SignInScreen()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 34),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: SvgPicture.string(
                  _shieldCheckSvg,
                  width: 46,
                  height: 46,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "Password Reset\nSuccessfully!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Reddit Sans',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                "Your Password has been changed successfully",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Reddit Sans',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const SignInScreen()),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Back to Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Reddit Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
