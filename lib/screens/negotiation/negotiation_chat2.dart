import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../account/my_profile.dart';
import '../expert profiles/expert_profile_about.dart';
import 'negotiation_chat.dart';
import 'service_summary.dart';

class NegotiationChat2Screen extends StatefulWidget {
  const NegotiationChat2Screen({super.key});

  @override
  State<NegotiationChat2Screen> createState() => _NegotiationChat2ScreenState();
}

class _NegotiationChat2ScreenState extends State<NegotiationChat2Screen> {
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // Sample conversation as shown in screenshot
  final List<Map<String, dynamic>> _messages = [
    {
      "date": "24 July 2025",
      "info":
          "Messages and calls are end-to-end encrypted. Only people in this chat can read, listen to, or share them.",
    },
    {"type": "sent", "text": "Hi Good Afternoon", "time": "1:52pm"},
    {
      "type": "sent",
      "text": "I have a problem with my generator, and I need a repair ASAP",
      "time": "1:52pm",
    },
    {"type": "received", "text": "Hi Good Afternoon", "time": "1:54pm"},
    {
      "type": "received",
      "text":
          "Okay sir, Can I see a picture of the generator, then I can know how much it will cost.",
      "time": "1:54pm",
    },
    {"type": "sent", "image": "Assets/generator image.png", "time": "1:56pm"},
    {
      "type": "received",
      "text":
          "I have your location sir, I can come and service the generator for #3000 only",
      "time": "2:00pm",
    },
    {
      "type": "sent",
      "text": "Okay, when you are done with the servicing, I will pay you",
      "time": "2:30pm",
    },
    {"type": "received", "text": "Okay sir!", "time": ""},
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
    // For demo, do nothing else
  }

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);
    const String profileImage = "Assets/friday chukwu image.jpg";
    const Color infoBg = Color(0xFFCFE7E5); // blue-green, matches previous file
    const Color chatBg = Color(0xFFF9F9F9);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black, size: 28),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const NegotiationChatScreen()),
            );
          },
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
                radius: 21,
                backgroundImage: AssetImage(profileImage),
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
          Positioned.fill(child: Container(color: chatBg)),
          Column(
            children: [
              const SizedBox(height: 10),
              // Date and Info Message
              if (_messages.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 16.0,
                    right: 16.0,
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
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 8,
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
              const SizedBox(height: 8),
              // "Today" label
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3.0,
                  horizontal: 0,
                ),
                child: Text(
                  "Today",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontFamily: 'Reddit Sans',
                    fontSize: 13,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  itemCount: _messages.length - 1,
                  itemBuilder: (context, i) {
                    final msg = _messages[i + 1];
                    if (msg["type"] == "sent") {
                      if (msg.containsKey("image")) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                right: 2,
                                left: 50,
                                bottom: 11,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: greenColor, width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Stack(
                                children: [
                                  Image.asset(
                                    msg["image"],
                                    width: 170,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  ),
                                  if ((msg["time"] as String).isNotEmpty)
                                    Positioned(
                                      bottom: 4,
                                      right: 7,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.35),
                                          borderRadius: BorderRadius.circular(
                                            7,
                                          ),
                                        ),
                                        child: Text(
                                          msg["time"],
                                          style: const TextStyle(
                                            fontSize: 11.5,
                                            color: Colors.white,
                                            fontFamily: 'Reddit Sans',
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 2,
                                  left: 60,
                                  bottom: 7,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 11,
                                  horizontal: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      msg["text"],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Reddit Sans',
                                      ),
                                    ),
                                    if ((msg["time"] as String).isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 4,
                                          right: 0,
                                        ),
                                        child: Text(
                                          msg["time"],
                                          style: const TextStyle(
                                            fontSize: 11.5,
                                            color: Colors.white,
                                            fontFamily: 'Reddit Sans',
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    } else if (msg["type"] == "received") {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 2,
                                right: 60,
                                bottom: 7,
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 11,
                                horizontal: 14,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    msg["text"],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Reddit Sans',
                                    ),
                                  ),
                                  if ((msg["time"] as String).isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 4,
                                        right: 0,
                                      ),
                                      child: Text(
                                        msg["time"],
                                        style: const TextStyle(
                                          fontSize: 11.5,
                                          color: Colors.grey,
                                          fontFamily: 'Reddit Sans',
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              // Hire Expert Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 7,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ServiceSummaryScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          "Hire Expert",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Reddit Sans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Message Input Bar
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
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
                                  style: const TextStyle(fontSize: 15),
                                ),
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
                              IconButton(
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.grey,
                                  size: 22,
                                ),
                                onPressed: _pickImage,
                                tooltip: "Send Camera Image",
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
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.send, // Paper plane, matches screenshot
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
