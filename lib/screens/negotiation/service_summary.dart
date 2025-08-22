import 'package:flutter/material.dart';
import 'booking_confirmation.dart';
import 'negotiation_chat2.dart';

class ServiceSummaryScreen extends StatelessWidget {
  const ServiceSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);

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
              MaterialPageRoute(builder: (_) => const NegotiationChat2Screen()),
            );
          },
        ),
        title: const Text(
          'Service Summary',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Reddit Sans',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Expert profile section
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      'Assets/friday chukwu image.jpg',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Friday Chukwu',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: 'Reddit Sans',
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          '+234 805 578 9354',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontFamily: 'Reddit Sans',
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Rating stars below the phone number
                        Row(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: Color(0xFFFFB800),
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Reddit Sans',
                ),
              ),
              const SizedBox(height: 15),

              // Summary card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      _buildSummaryRow('Service needed', 'Generator Service'),
                      const SizedBox(height: 16),
                      _buildSummaryRow('My Location', 'Ojo Lagos post service'),
                      const SizedBox(height: 16),
                      _buildSummaryRow(
                        'Description',
                        'The oil of the generator needs to be changed and serviced',
                      ),
                      const SizedBox(height: 16),
                      _buildSummaryRow('Date', 'Monday 17th August'),
                      const SizedBox(height: 16),
                      _buildSummaryRow('Time', '8:00AM'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // View status button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BookingConfirmationScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'View status',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Reddit Sans',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
              fontFamily: 'Reddit Sans',
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Reddit Sans',
            ),
          ),
        ),
      ],
    );
  }
}
