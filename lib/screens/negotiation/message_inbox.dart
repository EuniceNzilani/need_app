import 'package:flutter/material.dart';

class MessageInboxScreen extends StatefulWidget {
  const MessageInboxScreen({Key? key}) : super(key: key);

  @override
  State<MessageInboxScreen> createState() => _MessageInboxScreenState();
}

class _MessageInboxScreenState extends State<MessageInboxScreen> {
  String selectedTab = 'All';
  String searchText = '';

  // Demo data for messages
  final List<Map<String, String>> allMessages = [
    {
      'name': 'Friday Chukwu',
      'message': 'Good afternoon Friday',
      'time': 'Just now',
      'status': 'active',
    },
    {
      'name': 'Friday Chukwu',
      'message': 'Good afternoon Friday',
      'time': 'Just now',
      'status': 'active',
    },
    {
      'name': 'Friday Chukwu',
      'message': 'Conversation Ended',
      'time': 'Just now',
      'status': 'ended',
    },
    {
      'name': 'Friday Chukwu',
      'message': 'Good afternoon Friday',
      'time': 'Just now',
      'status': 'active',
    },
    {
      'name': 'Friday Chukwu',
      'message': 'Conversation Ended',
      'time': 'Just now',
      'status': 'ended',
    },
    {
      'name': 'Friday Chukwu',
      'message': 'Good afternoon Friday',
      'time': 'Just now',
      'status': 'active',
    },
    {
      'name': 'Friday Chukwu',
      'message': 'Conversation Ended',
      'time': 'Just now',
      'status': 'ended',
    },
  ];

  final List<Map<String, String>> endedMessages = [
    {
      'name': 'Friday Chukwu',
      'message': 'Conversation Ended',
      'time': 'Yesterday',
      'status': 'ended',
    },
    {
      'name': 'Friday Chukwu',
      'message': 'Conversation Ended',
      'time': '12 June 2025',
      'status': 'ended',
    },
    {
      'name': 'Friday Chukwu',
      'message': 'Conversation Ended',
      'time': 'One month ago',
      'status': 'ended',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final messages = selectedTab == 'All' ? allMessages : endedMessages;
    final filteredMessages =
        messages.where((msg) {
          return msg['name']!.toLowerCase().contains(
            searchText.trim().toLowerCase(),
          );
        }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black, size: 28),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Message Inbox',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Reddit Sans',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ), // matches screenshot
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search box
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (val) => setState(() => searchText = val),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black54,
                    size: 22,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Reddit Sans',
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 0,
                  ),
                ),
              ),
            ),
            // All / Ended buttons
            Row(
              children: [
                _TabButton(
                  label: 'All',
                  isSelected: selectedTab == 'All',
                  onTap: () => setState(() => selectedTab = 'All'),
                ),
                const SizedBox(width: 10),
                _TabButton(
                  label: 'Ended',
                  isSelected: selectedTab == 'Ended',
                  onTap: () => setState(() => selectedTab = 'Ended'),
                ),
              ],
            ),
            const SizedBox(height: 18),
            // Message list
            Expanded(
              child: ListView.separated(
                itemCount: filteredMessages.length,
                separatorBuilder:
                    (_, __) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 1,
                      color: Colors.grey.shade100,
                    ),
                itemBuilder: (context, index) {
                  final msg = filteredMessages[index];
                  return _MessageTile(
                    name: msg['name']!,
                    message: msg['message']!,
                    time: msg['time']!,
                    status: msg['status']!,
                    imagePath: 'Assets/friday chukwu image.jpg',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 36,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF23B09B) : Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color:
                  isSelected ? const Color(0xFF23B09B) : Colors.grey.shade300,
              width: 1,
            ),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: const Color(0xFF23B09B).withOpacity(0.08),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Reddit Sans',
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String status;
  final String imagePath;

  const _MessageTile({
    required this.name,
    required this.message,
    required this.time,
    required this.status,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // profile avatar
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(radius: 23, backgroundImage: AssetImage(imagePath)),
            if (status == 'active')
              Positioned(
                bottom: 2,
                right: 1,
                child: Container(
                  width: 11,
                  height: 11,
                  decoration: BoxDecoration(
                    color: const Color(0xFF23B09B),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            if (status == 'ended')
              Positioned(
                bottom: 2,
                right: 1,
                child: Container(
                  width: 11,
                  height: 11,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.transparent, width: 2),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 14),
        // name + message
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  fontFamily: 'Reddit Sans',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                message,
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Reddit Sans',
                  color: status == 'ended' ? Colors.black54 : Colors.black87,
                ),
              ),
            ],
          ),
        ),
        // time
        Text(
          time,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Reddit Sans',
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
