import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_nav.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _currentIndex = 2;

  void _onNavTap(int idx) {
    setState(() => _currentIndex = idx);
    if (idx == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (idx == 1) {
      Navigator.pushReplacementNamed(context, '/ai_help_centre');
    }
    // idx==2 is Notifications (current)
  }

  // Use the correct path for the profile image everywhere
  static const String _profileImagePath = 'Assets/friday chukwu image.jpg';

  final List<Map<String, String>> _notifications = [
    {
      "avatar": _profileImagePath,
      "title": "Friday Chukwu accepted your request Service",
      "message":
          "You can now work with friday chukwu and share important information with him as your expert",
      "time": "Just now",
    },
    {
      "avatar": _profileImagePath,
      "title": "Friday Chukwu accepted your request Service",
      "message":
          "You can now work with friday chukwu and share important information with him as your expert",
      "time": "2 hours ago",
    },
    {
      "avatar": _profileImagePath,
      "title": "Friday Chukwu accepted your request Service",
      "message":
          "You can now work with friday chukwu and share important information with him as your expert",
      "time": "1 day ago",
    },
    {
      "avatar": _profileImagePath,
      "title": "Friday Chukwu accepted your request Service",
      "message":
          "You can now work with friday chukwu and share important information with him as your expert",
      "time": "Just now",
    },
    {
      "avatar": _profileImagePath,
      "title": "Friday Chukwu accepted your request Service",
      "message":
          "You can now work with friday chukwu and share important information with him as your expert",
      "time": "2 hours ago",
    },
    {
      "avatar": _profileImagePath,
      "title": "Friday Chukwu accepted your request Service",
      "message":
          "You can now work with friday chukwu and share important information with him as your expert",
      "time": "1 day ago",
    },
  ];

  Widget _notificationCard(Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(data["avatar"]!),
            backgroundColor: Colors.grey[200],
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["title"]!,
                  style: const TextStyle(
                    fontFamily: 'RedditSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 14.5,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data["message"]!,
                  style: const TextStyle(
                    fontFamily: 'RedditSans',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      data["time"]!,
                      style: const TextStyle(
                        fontFamily: 'RedditSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFFB6B6B6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black, size: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontFamily: 'RedditSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: ListView.builder(
            itemCount: _notifications.length,
            itemBuilder: (context, idx) {
              return _notificationCard(_notifications[idx]);
            },
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
