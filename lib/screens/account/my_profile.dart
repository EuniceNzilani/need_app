import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_nav.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

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
    // idx==2 is this profile screen
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder:
          (ctx) => Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 28),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.22),
                      blurRadius: 24,
                      offset: const Offset(0, 6),
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
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      "If you Logout, you have to sign in again, by inputting your credentials, to have access to your profile",
                      style: TextStyle(
                        fontFamily: 'RedditSans',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 42,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF14A388),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 2,
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop();
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
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SizedBox(
                            height: 42,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide.none,
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/my_profile',
                                );
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  fontFamily: 'RedditSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
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
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 16,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Image
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE7F6F3),
              image: const DecorationImage(
                image: AssetImage('Assets/friday chukwu image.jpg'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          // Name & Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Friday Chukwu",
                  style: TextStyle(
                    fontFamily: 'RedditSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Ojo East Service, Lagos State",
                  style: TextStyle(
                    fontFamily: 'RedditSans',
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "+234 805 578 9164",
                  style: TextStyle(
                    fontFamily: 'RedditSans',
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Edit Profile Button
          SizedBox(
            height: 36,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF7F7F7),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              icon: const Icon(Icons.edit, size: 18),
              label: const Text(
                "Edit Profile",
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/edit_profile');
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
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: const Color(0xFF14A388), size: 24),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'RedditSans',
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.black,
          size: 24,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
        tileColor: Colors.white,
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
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontFamily: 'RedditSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          children: [
            _buildProfileCard(),
            const SizedBox(height: 2),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Account Settings",
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            _buildSettingItem(
              'Change Pasword',
              icon: Icons.lock_outline,
              onTap: () => Navigator.pushNamed(context, '/change_password'),
            ),
            _buildSettingItem(
              'Personal Details',
              icon: Icons.person_outline,
              onTap: () => Navigator.pushNamed(context, '/personal_details'),
            ),
            _buildSettingItem(
              'Notifications settings',
              icon: Icons.notifications_none,
              onTap: () => Navigator.pushNamed(context, '/notifications'),
            ),
            _buildSettingItem(
              'Frequently Used Experts',
              icon: Icons.people_outline,
              onTap:
                  () =>
                      Navigator.pushNamed(context, '/frequently_used_experts'),
            ),
            _buildSettingItem(
              'Service History',
              icon: Icons.history,
              onTap: () => Navigator.pushNamed(context, '/service_history'),
            ),
            _buildSettingItem(
              'Messages',
              icon: Icons.message_outlined,
              onTap: () => Navigator.pushNamed(context, '/messages'),
            ),
            _buildSettingItem(
              'Deactivate/Delete Account',
              icon: Icons.delete_outline,
              onTap:
                  () => Navigator.pushNamed(
                    context,
                    '/deactivate_delete_account',
                  ),
            ),
            _buildSettingItem(
              'About app',
              icon: Icons.info_outline,
              onTap: () => Navigator.pushNamed(context, '/about_app'),
            ),
            // Logout Button
            const SizedBox(height: 6),
            InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: _showLogoutDialog,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 2,
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.exit_to_app,
                    color: Color(0xFF14A388),
                    size: 24,
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: 'RedditSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 24,
                  ),
                  contentPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  tileColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
