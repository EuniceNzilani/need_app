import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../account/my_profile.dart';

class NegotiationChatScreen extends StatefulWidget {
  const NegotiationChatScreen({super.key});

  @override
  State<NegotiationChatScreen> createState() => _NegotiationChatScreenState();
}

class _NegotiationChatScreenState extends State<NegotiationChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // Simulate chat messages
  final List<Map<String, String>> _messages = [
    {
      "date": "24 July 2025",
      "info":
          "Messages and calls are end-to-end encrypted. Only people in this chat can read, listen to, or share them.",
    },
  ];

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      // You can handle or show the picked image here (send or preview)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image selected: ${pickedFile.name}')),
      );
    }
  }

  Future<void> _pickFile() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      // You can handle or show the picked file here (send or preview)
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('File selected: ${file.name}')));
    }
  }

  void _sendMessage() {
    // For now, just clear the input and stay on this screen
    _controller.clear();
    // Navigate to self to simulate "stay here"
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const NegotiationChatScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MyProfileScreen()),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 21,
                backgroundImage: const NetworkImage(
                  "https://randomuser.me/api/portraits/men/32.jpg",
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Friday Chukwu   (3km away from you)',
                    style: TextStyle(
                      fontFamily: 'Reddit Sans',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(
                      color: greenColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Reddit Sans',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background pattern can be implemented as an asset or left blank for now
          Positioned.fill(
            child: Container(
              color: const Color(0xFFF9F9F9),
              // Optionally: add background image/pattern here
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              // Date and Info Message
              if (_messages.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Text(
                        _messages[0]["date"]!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Reddit Sans',
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.10),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Text(
                          _messages[0]["info"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.teal,
                            fontSize: 13,
                            fontFamily: 'Reddit Sans',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              // ...Here you can add chat bubbles as needed
              const Expanded(child: SizedBox()),
              // Message Input Bar
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 14,
                    left: 14,
                    right: 14,
                    top: 2,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 6,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 14),
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  decoration: const InputDecoration(
                                    hintText: "Message",
                                    border: InputBorder.none,
                                  ),
                                  minLines: 1,
                                  maxLines: 4,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.grey,
                                  size: 22,
                                ),
                                onPressed: _pickImage,
                                tooltip: "Send Camera Image",
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.attach_file,
                                  color: Colors.grey,
                                  size: 22,
                                ),
                                onPressed: _pickFile,
                                tooltip: "Attach File",
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 9),
                      GestureDetector(
                        onTap: _sendMessage,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
