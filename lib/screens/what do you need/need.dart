import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:io';

import '/widgets/custom_top_nav.dart';
import '/widgets/custom_bottom_nav.dart';

// Color definitions
const Color kMainGreen = Color(0xFF14A388); // Button and popup green
const Color kVeryLightGreen = Color(
  0xFFE7FCF4,
); // Very light shade for backgrounds
const Color kGrayBg = Color(0xFFE9E9E9);

class NeedScreen extends StatefulWidget {
  const NeedScreen({super.key});

  @override
  State<NeedScreen> createState() => _NeedScreenState();
}

class _NeedScreenState extends State<NeedScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _needController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final List<String> _allSuggestions = [
    "Generator Services",
    "Gas Delivery",
    "Device and Gadgets Services",
    "Aluminium and Glass works",
    "Painting",
    "Laundry Service",
    "Plumbing",
    "Electrical Repairs",
    "Catering",
    "Cleaning",
    "Gas Repair",
    "AC Installation",
    "Welding/Fabrication",
    "Interior Decoration",
    "Mobile Car Mechanic",
    "Carpentry",
    "Barbing",
    "Hairdressing",
    "Nail Services",
    "Inverter Installation",
    "POP Ceiling",
    "Tiling",
    "Event Planning",
    "Borehole Drilling",
    "Shoe Repair",
    "Shoe Making",
    "Tailoring",
    "Fashion Design",
    "Computer Repairs",
    "Phone Repairs",
    "Painting",
    "Photography",
    "DJ Services",
    "MC/Comedian",
    "Makeup Artist",
    "Videography",
    "Courier Service",
    "Errand Service",
    "Private Tutoring",
    "Lesson Teacher",
    "Home Lesson",
    "Swimming Instructor",
    "Fitness Trainer",
    "House Cleaning",
    "Gardening",
    "Security",
    "Pest Control",
    "Movers/Haulage",
    "Logistics",
    "Baking",
    "Cake Making",
    "Pastries",
    "Catering",
    "Dietician",
    "Nanny",
    "Babysitting",
    "Elderly Care",
    "Nursing Care",
    "Dog Walking",
    "Vet/Home Vet",
    "Laundry Pickup",
    "Laundry Delivery",
    "Dry Cleaning",
    "Ironing",
  ];
  List<String> _filteredSuggestions = [];

  XFile? _imageFile;
  bool _showSuggestions = false;
  bool _serviceImmediately = false;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _needController.addListener(_onNeedChanged);
  }

  @override
  void dispose() {
    _needController.removeListener(_onNeedChanged);
    _needController.dispose();
    _descriptionController.dispose();
    _budgetController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  void _onNeedChanged() {
    final input = _needController.text.trim().toLowerCase();
    setState(() {
      if (input.isEmpty) {
        _filteredSuggestions = [];
      } else {
        // Suggestions that start with the same letters as typed
        _filteredSuggestions =
            _allSuggestions
                .where((s) => s.toLowerCase().startsWith(input))
                .toList();
        // fallback: contains (not startsWith)
        if (_filteredSuggestions.isEmpty) {
          _filteredSuggestions =
              _allSuggestions
                  .where((s) => s.toLowerCase().contains(input))
                  .toList();
        }
      }
      _showSuggestions = input.isNotEmpty && _filteredSuggestions.isNotEmpty;
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = picked;
      });
    }
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: const DialogTheme(backgroundColor: kVeryLightGreen),
            colorScheme: const ColorScheme.light(
              primary: kMainGreen,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (!mounted) return;
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: const DialogTheme(backgroundColor: kVeryLightGreen),
            colorScheme: const ColorScheme.light(
              primary: kMainGreen,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (!mounted) return;
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  void _onSuggestionTap(String suggestion) {
    setState(() {
      _needController.text = suggestion;
      _showSuggestions = false;
    });
  }

  void _onSendRequest() {
    if (_formKey.currentState?.validate() ?? false) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (_) => Center(
              child: Container(
                width: 260,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check_circle, color: kMainGreen, size: 48),
                    const SizedBox(height: 18),
                    const Text(
                      "Service Request posted\nSuccessfully",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Reddit Sans',
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
      );
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      });
    }
  }

  void _handleBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/ai_support');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/account');
        break;
    }
  }

  Widget requiredLabel(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Reddit Sans',
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        const Text(
          ' *',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  BoxDecoration shadowBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(20),
        blurRadius: 10,
        offset: const Offset(0, 3),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomTopNav(
        showEditLocation: true,
        showNotifications: true,
        showSettings: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500, minWidth: 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // What do you need done today
                        requiredLabel("What do you NEED done today?"),
                        const SizedBox(height: 6),
                        Stack(
                          children: [
                            Container(
                              decoration: shadowBoxDecoration(),
                              child: TextFormField(
                                controller: _needController,
                                readOnly: false,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 14,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    _showSuggestions = true;
                                    _onNeedChanged();
                                  });
                                },
                                onChanged: (_) => _onNeedChanged(),
                                validator:
                                    (value) =>
                                        value == null || value.isEmpty
                                            ? "Please specify a service"
                                            : null,
                              ),
                            ),
                            if (_showSuggestions &&
                                _filteredSuggestions.isNotEmpty)
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 60,
                                child: Material(
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(6),
                                  child: ListView(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    children:
                                        _filteredSuggestions.take(8).map((s) {
                                          return ListTile(
                                            title: Text(s),
                                            onTap: () => _onSuggestionTap(s),
                                          );
                                        }).toList(),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        requiredLabel("Description"),
                        const SizedBox(height: 6),
                        Container(
                          decoration: shadowBoxDecoration(),
                          child: TextFormField(
                            controller: _descriptionController,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 14,
                              ),
                            ),
                            validator:
                                (value) =>
                                    value == null || value.isEmpty
                                        ? "Please enter a description"
                                        : null,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Upload photo (optional)",
                          style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: 'Reddit Sans',
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: _pickImage,
                          child: DottedBorder(
                            color: kMainGreen.withAlpha((0.35 * 255).round()),
                            dashPattern: [6, 4],
                            strokeWidth: 1.2,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            child: Container(
                              width: double.infinity,
                              height: 110,
                              color: kVeryLightGreen,
                              child:
                                  _imageFile == null
                                      ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.upload_rounded,
                                            size: 38,
                                            color: kMainGreen,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Upload your image here (JPEG/PNG)",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 13,
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            "Browse",
                                            style: TextStyle(
                                              color: kMainGreen,
                                              fontSize: 13.5,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ],
                                      )
                                      : ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          File(_imageFile!.path),
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 110,
                                        ),
                                      ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          "Budget Range (₦) (optional)",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Reddit Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          decoration: shadowBoxDecoration(),
                          child: TextFormField(
                            controller: _budgetController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Preferred Date",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Reddit Sans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    decoration: shadowBoxDecoration(),
                                    child: TextFormField(
                                      controller: _dateController,
                                      enabled: !_serviceImmediately,
                                      readOnly: true,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 14,
                                        ),
                                        suffixIcon: Icon(
                                          Icons.calendar_today_rounded,
                                        ),
                                      ),
                                      onTap:
                                          _serviceImmediately
                                              ? null
                                              : _pickDate,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Preferred Time",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Reddit Sans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    decoration: shadowBoxDecoration(),
                                    child: TextFormField(
                                      controller: _timeController,
                                      enabled: !_serviceImmediately,
                                      readOnly: true,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 14,
                                        ),
                                        suffixIcon: Icon(Icons.access_time),
                                      ),
                                      onTap:
                                          _serviceImmediately
                                              ? null
                                              : _pickTime,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Checkbox(
                              value: _serviceImmediately,
                              onChanged: (v) {
                                setState(() {
                                  _serviceImmediately = v ?? false;
                                  if (_serviceImmediately) {
                                    _dateController.clear();
                                    _timeController.clear();
                                  }
                                });
                              },
                              activeColor: kMainGreen,
                            ),
                            const Text(
                              "NEED Service Immediately",
                              style: TextStyle(
                                fontFamily: 'Reddit Sans',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.5,
                              ),
                            ),
                          ],
                        ),
                        // Location label and edit location link above the box
                        const SizedBox(height: 26),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Location",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Reddit Sans',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/edit_profile');
                              },
                              child: const Text(
                                "Edit Location",
                                style: TextStyle(
                                  color: kMainGreen,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Reddit Sans',
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Container(
                          height: 48,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: kGrayBg,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Ojo Lagos Post...",
                              style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Reddit Sans',
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kMainGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: _onSendRequest,
                            child: const Text(
                              "Send Service Request",
                              style: TextStyle(
                                fontFamily: 'Reddit Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: _handleBottomNavTap,
      ),
    );
  }
}
