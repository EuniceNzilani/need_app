import 'package:flutter/material.dart';
import '../screens/account/edit_profile.dart';
import '../screens/account/my_profile.dart';
import '../screens/account/notifications.dart';

class CustomTopNav extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showEditLocation;
  final bool showNotifications;
  final bool showSettings;

  const CustomTopNav({
    Key? key,
    this.title = '',
    this.showEditLocation = true,
    this.showNotifications = true,
    this.showSettings = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Location section with pin icon
          if (showEditLocation)
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on, color: Colors.black, size: 20),
                        const SizedBox(width: 4),
                        const Text(
                          "Ojo Lagos Post...",
                          style: TextStyle(
                            fontFamily: 'RedditSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        "Edit Location",
                        style: TextStyle(
                          fontFamily: 'RedditSans',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF14A388),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            const SizedBox(width: 140),

          // Optional Title (centered)
          if (title.isNotEmpty)
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'RedditSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

          // Right side icons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showNotifications)
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Color(0xFF14A388).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.black87,
                          size: 20, // Reduced from 24 to 20
                        ),
                        tooltip: 'Notifications',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationsScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              if (showSettings)
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Color(0xFF14A388).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.settings_outlined,
                          color: Colors.black87,
                          size: 20, // Reduced from 24 to 20
                        ),
                        tooltip: 'Settings',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyProfileScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
