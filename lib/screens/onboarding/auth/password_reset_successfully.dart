import 'package:flutter/material.dart';
import '../sign_in_screen.dart';

class PasswordResetSuccessfullyScreen extends StatelessWidget {
  const PasswordResetSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);
    const Color iconColor = Color(0xFF14A388);
    const Color iconBackgroundColor = Color(0xFFE6F7F4);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Text(
            "<",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                child: const Icon(
                  Icons.verified_rounded,
                  color: iconColor,
                  size: 50,
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
