import 'package:flutter/material.dart';
import '../../widgets/progress_dots.dart';

class SpecialFeatureScreen extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const SpecialFeatureScreen({
    super.key,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                child: Image.asset(
                  'Assets/special feature.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Special Feature',
              style: TextStyle(
                fontFamily: 'RedditSans',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Are you looking to buy items directly from China? NEED simplifies the process and reduces the stress.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
            const ProgressDots(currentStep: 1, totalSteps: 3),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: onSkip,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RedditSans',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: const Color(0xFF14A388),
                    onPressed: onNext,
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
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
