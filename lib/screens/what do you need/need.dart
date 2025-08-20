import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

import '../account/edit_profile.dart';

class NeedScreen extends StatefulWidget {
  const NeedScreen({Key? key}) : super(key: key);

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
    // add more suggestions as needed
  ];
  List<String> _filteredSuggestions = [];

  XFile? _imageFile;
  bool _showSuggestions = false;
  bool _serviceImmediately = false;

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
    setState(() {
      _filteredSuggestions =
          _allSuggestions
              .where(
                (s) => s.toLowerCase().contains(
                  _needController.text.toLowerCase(),
                ),
              )
              .toList();
      _showSuggestions = _needController.text.isNotEmpty;
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
    );
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
    );
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
                    const Icon(
                      Icons.check_circle,
                      color: Color(0xFF14A388),
                      size: 48,
                    ),
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
        Navigator.of(context).pop(); // Close popup
        Navigator.of(context).pop(); // Go back
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.location_on, color: Colors.black, size: 20),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ojo Lagos Post...',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft,
                textStyle: const TextStyle(decoration: TextDecoration.none),
              ),
              child: const Text(
                'Edit Location',
                style: TextStyle(
                  color: Color(0xFF23B09B),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Reddit Sans',
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.people_alt_rounded,
              color: Colors.black,
              size: 22,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.black,
              size: 22,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    // What do you NEED done today? (autocomplete)
                    Stack(
                      children: [
                        TextFormField(
                          controller: _needController,
                          readOnly: false,
                          decoration: InputDecoration(
                            labelText: "What do you NEED done today? *",
                            border: border,
                            enabledBorder: border,
                            focusedBorder: border,
                          ),
                          onTap: () {
                            setState(() {
                              _showSuggestions = true;
                              _filteredSuggestions = _allSuggestions;
                            });
                          },
                          validator:
                              (value) =>
                                  value == null || value.isEmpty
                                      ? "Please specify a service"
                                      : null,
                        ),
                        if (_showSuggestions && _filteredSuggestions.isNotEmpty)
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
                                    _filteredSuggestions.map((s) {
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

                    // Description
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Description *",
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Please enter a description"
                                  : null,
                    ),
                    const SizedBox(height: 20),

                    // Upload photo
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        InkWell(
                          onTap: _pickImage,
                          child: Container(
                            width: double.infinity,
                            height: 110,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF6FCFA),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFF23B09B).withOpacity(0.3),
                              ),
                            ),
                            child:
                                _imageFile == null
                                    ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.upload_rounded,
                                          size: 38,
                                          color: Color(0xFF23B09B),
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
                                            color: Color(0xFF23B09B),
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 13.5,
                                          ),
                                        ),
                                      ],
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        // ignore: unnecessary_null_comparison
                                        File(_imageFile!.path),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 110,
                                      ),
                                    ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // Budget Range (optional)
                    TextFormField(
                      controller: _budgetController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Budget Range (₦) (optional)",
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Preferred Date & Time
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: _dateController,
                            enabled: !_serviceImmediately,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "Preferred Date",
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_today_rounded),
                                onPressed:
                                    _serviceImmediately ? null : _pickDate,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: TextFormField(
                            controller: _timeController,
                            enabled: !_serviceImmediately,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "Preferred Time",
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.access_time),
                                onPressed:
                                    _serviceImmediately ? null : _pickTime,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    // NEED Service Immediately
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
                          activeColor: const Color(0xFF23B09B),
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
                    const SizedBox(height: 10),

                    // Location and Edit Location
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: "Location",
                              hintText: "Ojo Lagos Post...",
                              border: border,
                              disabledBorder: border,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EditProfileScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Edit Location",
                            style: TextStyle(
                              color: Color(0xFF23B09B),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Reddit Sans',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    // Send Service Request Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF14A388),
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: const Color(0xFF14A388),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wifi_tethering),
            label: 'AI Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
        onTap: (index) {
          // Implement navigation if needed
        },
      ),
    );
  }
}

// Dummy edit profile screen for routing
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Edit Profile')),
    body: const Center(child: Text('Edit Profile Screen')),
  );
}
