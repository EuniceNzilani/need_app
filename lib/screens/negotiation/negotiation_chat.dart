import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../account/my_profile.dart';
import '../expert profiles/expert_profile_about.dart';
import 'negotiation_chat2.dart';

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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image selected: ${pickedFile.name}')),
      );
    }
  }

  Future<void> _pickFile() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('File selected: ${file.name}')));
    }
  }

  void _sendMessage() {
    _controller.clear();
    // For demo: do nothing else
  }

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);
    const String profileImage = "Assets/friday chukwu image.jpg";
    const Color infoBg = Color(0xFFCFE7E5);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(63),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.black, size: 28),
            onPressed: () => Navigator.of(context).pop(),
          ),
          titleSpacing: 0,
          title: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ExpertProfileAbout()),
              );
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(profileImage),
                ),
                const SizedBox(width: 9),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Friday Chukwu  (2km away from you)',
                      style: TextStyle(
                        fontFamily: 'Reddit Sans',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.5,
                      ),
                    ),
                    SizedBox(height: 1.5),
                    Text(
                      'Online',
                      style: TextStyle(
                        color: greenColor,
                        fontSize: 12.5,
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
      ),
      body: Stack(
        children: [
          Positioned.fill(child: Container(color: Colors.white)),
          Column(
            children: [
              const SizedBox(height: 12),
              // Date and Info Message
              if (_messages.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                    left: 20,
                    right: 20,
                    bottom: 8,
                  ),
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
                      const SizedBox(height: 7),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: infoBg,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Text(
                          _messages[0]["info"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Reddit Sans',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const Expanded(child: SizedBox()),
              // Message Input Bar (SafeArea included)
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 13),
                  child: Row(
                    children: [
                      // Text input
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  decoration: const InputDecoration(
                                    hintText: "Message",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(fontSize: 15),
                                    isDense: true,
                                  ),
                                  minLines: 1,
                                  maxLines: 4,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.attach_file,
                                  color: Colors.grey,
                                  size: 22,
                                ),
                                padding: const EdgeInsets.only(right: 2),
                                onPressed: _pickFile,
                                tooltip: "Attach File",
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.grey,
                                  size: 22,
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: _pickImage,
                                tooltip: "Send Camera Image",
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 9),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NegotiationChat2Screen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons
                                  .send, // Paper plane arrow to match previous file
                              color: Colors.white,
                              size: 26,
                            ),
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
