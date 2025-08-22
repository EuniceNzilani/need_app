import 'package:flutter/material.dart';
import 'screens/onboarding/app_goals.dart';
import 'screens/onboarding/special_feature.dart';
import 'screens/onboarding/smart_ai_help.dart';
import 'screens/onboarding/sign_in_screen.dart';
import 'screens/onboarding/sign_up_screen.dart';
import 'screens/onboarding/location_permission.dart';
import 'screens/home.dart';
import 'screens/what do you need/need.dart';
import 'screens/import from china/import.dart'
    hide MyProfileScreen, NotificationsScreen;
import 'screens/import from china/track_request.dart'
    hide MyProfileScreen, NotificationsScreen;
import 'screens/expert profiles/services_available.dart';
import 'screens/ai/ai_help_centre.dart';
import 'screens/account/my_profile.dart';
import 'screens/negotiation/message_inbox.dart';

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
                  () => Navigator.pushReplacementNamed(context, '/sign_up'),
              onSkip: () => Navigator.pushReplacementNamed(context, '/sign_in'),
            ),
        '/sign_in': (context) => const SignInScreen(),
        '/sign_up': (context) => const SignUpScreen(),
        '/location_permission': (context) => const LocationPermissionScreen(),
        '/home': (context) => const Home(),
        '/need': (context) => const NeedScreen(),
        '/import': (context) => const Import(),
        '/track_request': (context) => const TrackRequest(),
        '/services_available': (context) => const ServicesAvailable(),
        '/ai_support': (context) => const AiHelpCentreScreen(),
        '/ai_help_centre': (context) => const AiHelpCentreScreen(),
        '/account': (context) => const MyProfileScreen(),
        '/my_profile': (context) => const MyProfileScreen(),
        '/message_inbox': (context) => const MessageInboxScreen(),
      },
    );
  }
}
