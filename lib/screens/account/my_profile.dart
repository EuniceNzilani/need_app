import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_nav.dart';

// Import all destination screens directly
import 'change_password.dart';
import 'personal_details.dart';
import 'notification_settings.dart';
import 'frequent_bookings.dart';
import 'service_history.dart';
import '../negotiation/message_inbox.dart'; // adjust if path differs
import 'deactivate.dart';
import 'about_app.dart';
import 'edit_profile.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  int _currentIndex = 2;

  void _onNavTap(int idx) {
    setState(() => _currentIndex = idx);
    if (idx == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (idx == 1) {
      Navigator.pushReplacementNamed(context, '/ai_help_centre');
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder:
          (ctx) => Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 22,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(56),
                      blurRadius: 18,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Are you sure?",
                      style: TextStyle(
                        fontFamily: 'RedditSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 15.5,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "If you Logout, you have to sign in again, by inputting your credentials, to have access to your profile",
                      style: TextStyle(
                        fontFamily: 'RedditSans',
                        fontSize: 12.5,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 38,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF14A388),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                elevation: 2,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                // Implement your logout logic here (e.g. clear session), then:
                                // Use pushReplacement to prevent back navigation to profile
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/sign_in',
                                );
                              },
                              child: const Text(
                                "Continue",
                                style: TextStyle(
                                  fontFamily: 'RedditSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 38,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  side: BorderSide.none,
                                ),
                                elevation: 0,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  fontFamily: 'RedditSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(23),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE7F6F3),
              image: const DecorationImage(
                image: AssetImage('Assets/friday chukwu image.jpg'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(25),
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Friday Chukwu",
                  style: TextStyle(
                    fontFamily: 'RedditSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Ojo East Service, Lagos State",
                  style: TextStyle(
                    fontFamily: 'RedditSans',
                    fontSize: 10.5,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "+234 805 578 9164",
                  style: TextStyle(
                    fontFamily: 'RedditSans',
                    fontSize: 10.5,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          SizedBox(
            height: 27,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF7F7F7),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              ),
              icon: const Icon(Icons.edit, size: 17, color: Colors.black),
              label: const Text(
                "Edit Profile",
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
    String title, {
    required IconData icon,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(11),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(20),
                  blurRadius: 7,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              dense: true,
              minLeadingWidth: 0,
              leading:
                  isLogout
                      ? const Icon(
                        Icons.power_settings_new,
                        color: Colors.black,
                        size: 24,
                      )
                      : Icon(icon, color: Colors.black, size: 24),
              title: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'RedditSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: Colors.black,
                size: 22,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 2,
              ),
              tileColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black, size: 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontFamily: 'RedditSans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildProfileCard(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Account Settings",
                    style: TextStyle(
                      fontFamily: 'RedditSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                _buildSettingItem(
                  'Change Password',
                  icon: Icons.lock_outline,
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ChangePasswordScreen(),
                        ),
                      ),
                ),
                _buildSettingItem(
                  'Personal Details',
                  icon: Icons.person_outline,
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PersonalDetailsScreen(),
                        ),
                      ),
                ),
                _buildSettingItem(
                  'Notifications settings',
                  icon: Icons.notifications_none,
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NotificationSettingsScreen(),
                        ),
                      ),
                ),
                _buildSettingItem(
                  'Frequently Used Experts',
                  icon: Icons.people_outline,
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FrequentBookingsScreen(),
                        ),
                      ),
                ),
                _buildSettingItem(
                  'Service History',
                  icon: Icons.history,
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ServiceHistoryScreen(),
                        ),
                      ),
                ),
                _buildSettingItem(
                  'Messages',
                  icon: Icons.message_outlined,
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MessageInboxScreen(),
                        ),
                      ),
                ),
                _buildSettingItem(
                  'Deactivate/Delete Account',
                  icon: Icons.delete_outline,
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DeactivateAccountScreen(),
                        ),
                      ),
                ),
                _buildSettingItem(
                  'About app',
                  icon: Icons.info_outline,
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AboutAppScreen(),
                        ),
                      ),
                ),
                _buildSettingItem(
                  'Logout',
                  icon:
                      Icons
                          .exit_to_app, // dummy, replaced with power_settings_new
                  onTap: _showLogoutDialog,
                  isLogout: true,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
