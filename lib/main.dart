import 'package:flutter/material.dart';
import 'screens/onboarding/app_goals.dart';
import 'screens/onboarding/special_feature.dart';
import 'screens/onboarding/smart_ai_help.dart';
import 'screens/onboarding/sign_in_screen.dart';
import 'screens/onboarding/sign_up_screen.dart';

void main() {
  runApp(const NEEDApp());
}

class NEEDApp extends StatelessWidget {
  const NEEDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEED',
      theme: ThemeData(
        fontFamily: 'RedditSans',
        primaryColor: const Color(0xFF14A388),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF14A388)),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/app_goals',
      routes: {
        '/app_goals':
            (context) => AppGoalsScreen(
              onNext: () => Navigator.pushNamed(context, '/special_feature'),
              onSkip: () => Navigator.pushReplacementNamed(context, '/sign_in'),
            ),
        '/special_feature':
            (context) => SpecialFeatureScreen(
              onNext: () => Navigator.pushNamed(context, '/smart_ai_help'),
              onSkip: () => Navigator.pushReplacementNamed(context, '/sign_in'),
            ),
        '/smart_ai_help':
            (context) => SmartAIHelpScreen(
              onGetStarted:
                  () => Navigator.pushReplacementNamed(
                    context,
                    '/sign_up',
                  ), // <-- FIXED HERE
              onSkip: () => Navigator.pushReplacementNamed(context, '/sign_in'),
            ),
        '/sign_in': (context) => const SignInScreen(),
        '/sign_up': (context) => const SignUpScreen(),
      },
    );
  }
}
