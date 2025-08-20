import 'package:flutter/material.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Booking Confirmation',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Reddit Sans',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 18),
          // Profile avatar and info
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundImage: const NetworkImage(
                    "https://randomuser.me/api/portraits/men/32.jpg",
                  ),
                ),
                const SizedBox(height: 9),
                const Text(
                  "Friday Chukwu",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: 'Reddit Sans',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  "(3km away from you)",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Reddit Sans',
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Timeline/Stepper
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline
                Column(
                  children: [
                    // Pending
                    _StatusDot(isActive: true, isFirst: true),
                    _DashedLine(),
                    // In Progress
                    _StatusDot(isActive: true),
                    _DashedLine(),
                    // Completed
                    _StatusDot(isActive: true, isLast: true),
                  ],
                ),
                const SizedBox(width: 20),
                // Step details & check
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _StatusText(
                        title: "Hired Expert, waiting to accept",
                        status: "Status: Pending",
                        statusColor: greenColor,
                      ),
                      const SizedBox(height: 6),
                      _CircleCheck(isChecked: true),
                      const SizedBox(height: 28),
                      _StatusText(
                        title: "Expert accepted and working",
                        status: "Status: In Progress",
                        statusColor: Colors.black87,
                      ),
                      const SizedBox(height: 6),
                      _CircleCheck(isChecked: true),
                      const SizedBox(height: 28),
                      _StatusText(
                        title: "Expert completed work.",
                        status: "Status: Completed",
                        statusColor: Colors.black87,
                      ),
                      const SizedBox(height: 6),
                      _CircleCheck(isChecked: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final bool isFirst;
  final bool isLast;
  const _StatusDot({
    this.isActive = false,
    this.isFirst = false,
    this.isLast = false,
  });
  @override
  Widget build(BuildContext context) {
    final color = isActive ? const Color(0xFF23B09B) : Colors.grey.shade400;
    return Container(
      width: 13,
      height: 13,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: color, width: 2),
      ),
    );
  }
}

class _DashedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Draw a vertical dashed line
    return SizedBox(
      height: 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
          (_) => Container(width: 2, height: 3, color: Colors.grey.shade300),
        ),
      ),
    );
  }
}

class _StatusText extends StatelessWidget {
  final String title;
  final String status;
  final Color statusColor;
  const _StatusText({
    required this.title,
    required this.status,
    required this.statusColor,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Reddit Sans',
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          status,
          style: TextStyle(
            fontFamily: 'Reddit Sans',
            fontSize: 14,
            color: statusColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _CircleCheck extends StatelessWidget {
  final bool isChecked;
  const _CircleCheck({required this.isChecked});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.check_circle,
          color: isChecked ? Colors.grey.shade700 : Colors.grey.shade300,
          size: 26,
        ),
      ),
    );
  }
}
