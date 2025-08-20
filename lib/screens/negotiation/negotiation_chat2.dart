import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../account/my_profile.dart';
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
    {"type": "sent", "text": "Hi Good Afternoon", "time": "1:35pm"},
    {
      "type": "sent",
      "text": "I have a problem with my generator, and I need a repair ASAP",
      "time": "1:35pm",
    },
    {"type": "received", "text": "Hi Good Afternoon", "time": "1:45pm"},
    {
      "type": "received",
      "text":
          "Okay sir, Can I see a picture of the generator, then I can know how much it will cost.",
      "time": "1:45pm",
    },
    {
      "type": "sent",
      "image":
          "https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=400&q=80",
      "time": "1:50pm",
    },
    {
      "type": "received",
      "text":
          "I have your location sir, I can come and service the generator for #3000 only",
      "time": "2:00pm",
    },
    {
      "type": "sent",
      "text": "Okay, when you are done with the servicing, I will pay you",
      "time": "2:05pm",
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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const NegotiationChat2Screen()),
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
          // Background pattern (optional, can be an asset)
          Positioned.fill(child: Container(color: const Color(0xFFF9F9F9))),
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
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
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
                              child: Image.network(
                                msg["image"],
                                width: 120,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if ((msg["time"] as String).isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 5,
                                      top: 2,
                                    ),
                                    child: Text(
                                      msg["time"],
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                        fontFamily: 'Reddit Sans',
                                      ),
                                    ),
                                  ),
                              ],
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
                                  bottom: 6,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Text(
                                  msg["text"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Reddit Sans',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if ((msg["time"] as String).isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 5,
                                      top: 2,
                                    ),
                                    child: Text(
                                      msg["time"],
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                        fontFamily: 'Reddit Sans',
                                      ),
                                    ),
                                  ),
                              ],
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
                                bottom: 6,
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Text(
                                msg["text"],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Reddit Sans',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if ((msg["time"] as String).isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                    top: 2,
                                  ),
                                  child: Text(
                                    msg["time"],
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                      fontFamily: 'Reddit Sans',
                                    ),
                                  ),
                                ),
                            ],
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
                    bottom: 8,
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
