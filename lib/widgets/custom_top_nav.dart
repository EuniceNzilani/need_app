import 'package:flutter/material.dart';

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
      elevation: 1,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Edit Location
          if (showEditLocation)
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                minimumSize: const Size(0, 40),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/edit_profile');
              },
              child: const Text(
                "Edit Location",
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF14A388),
                ),
              ),
            )
          else
            const SizedBox(width: 115), // Keeps icons right-aligned if edit hidden

          // Optional Title
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

          // Icons
          Row(
            children: [
              if (showNotifications)
                IconButton(
                  icon: const Icon(Icons.notifications_none, color: Colors.black, size: 28),
                  tooltip: 'Notifications',
                  onPressed: () {
                    Navigator.pushNamed(context, '/notifications');
                  },
                ),
              if (showSettings)
                IconButton(
                  icon: const Icon(Icons.settings_outlined, color: Colors.black, size: 28),
                  tooltip: 'Settings',
                  onPressed: () {
                    Navigator.pushNamed(context, '/my_profile');
                  },
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