import 'package:flutter/material.dart';

class ProgressDots extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProgressDots({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        final isActive = index == currentStep;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 16 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF14A388) : const Color(0xFFE0E0E0),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
