import 'package:flutter/material.dart';

/// Bottom navigation bar widget.
class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const selectedColor = Color(0xFF14A388);
    const unselectedColor = Colors.black;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15), // 0.06 * 255 = 15
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy_outlined),
            activeIcon: Icon(Icons.smart_toy_rounded),
            label: 'AI Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

/// Top navigation AppBar widget (renamed for clarity).
class CustomAppBarNav extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showEditLocation;
  final bool showNotifications;
  final bool showSettings;

  const CustomAppBarNav({
    super.key,
    this.title = '',
    this.showEditLocation = true,
    this.showNotifications = true,
    this.showSettings = true,
  });

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
                Navigator.pushNamed(context, '/edit_profile');
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
                        const Icon(
                          Icons.location_on,
                          color: Colors.black,
                          size: 20,
                        ),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 24),
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
                          color: const Color(
                            0xFF14A388,
                          ).withAlpha(25), // 0.1*255 = 25
                          shape: BoxShape.circle,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.black87,
                          size: 24,
                        ),
                        tooltip: 'Notifications',
                        onPressed: () {
                          Navigator.pushNamed(context, '/notifications');
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
                          color: const Color(
                            0xFF14A388,
                          ).withAlpha(25), // 0.1*255 = 25
                          shape: BoxShape.circle,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.settings_outlined,
                          color: Colors.black87,
                          size: 24,
                        ),
                        tooltip: 'Settings',
                        onPressed: () {
                          Navigator.pushNamed(context, '/my_profile');
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
