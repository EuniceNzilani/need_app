import 'package:flutter/material.dart';
import '../sign_in_screen.dart';

class PasswordResetSuccessfullyScreen extends StatelessWidget {
  const PasswordResetSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                  color: const Color(0xFFF3FAF8),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  Icons.verified_rounded,
                  color: greenColor,
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
                  color: Colors.black54,
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
