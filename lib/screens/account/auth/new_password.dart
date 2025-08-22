import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Import the success screen and this screen for navigation
import 'password_changed_successfully.dart';
import 'new_password.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  static const String _lockSvg = '''
<?xml version="1.0"?>
<svg id="Layer_1" style="enable-background:new 0 0 30 30;" version="1.1" viewBox="0 0 30 30" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
  <path d="M21,12  H9V9c0-3.314,2.686-6,6-6h0c3.314,0,6,2.686,6,6V12z" style="fill:none;stroke:#14A388;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;"/>
  <path d="M24,11H6c-1.105,0-2,0.895-2,2v12c0,1.105,0.895,2,2,2h18c1.105,0,2-0.895,2-2V13C26,11.895,25.105,11,24,11z M15,21  c-1.105,0-2-0.896-2-2c0-1.105,0.895-2,2-2s2,0.895,2,2C17,20.104,16.105,21,15,21z M21,21c-1.105,0-2-0.896-2-2  c0-1.105,0.895-2,2-2s2,0.895,2,2C23,20.104,22.105,21,21,21z M9,21c-1.105,0-2-0.896-2-2c0-1.105,0.895-2,2-2s2,0.895,2,2  C11,20.104,10.105,21,9,21z" style="stroke:#14A388;fill:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;"/>
</svg>
''';

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onChangedPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PasswordChangedSuccessfullyScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed:
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewPasswordScreen(),
                ),
              ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Raised content up by reducing initial spacing
                  const SizedBox(height: 0),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F7F4),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: SvgPicture.string(_lockSvg, width: 46, height: 46),
                    ),
                  ),
                  const SizedBox(height: 24), // was 34
                  const Text(
                    "Change Password",
                    style: TextStyle(
                      fontFamily: 'RedditSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Your New Password must be different from\npreviously used password",
                    style: TextStyle(
                      fontFamily: 'RedditSans',
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24), // was 32
                  // Old Password
                  _PasswordField(
                    controller: _oldPasswordController,
                    hintText: "Old Password",
                    obscureText: _obscureOld,
                    onToggle: () => setState(() => _obscureOld = !_obscureOld),
                  ),
                  const SizedBox(height: 18),
                  // New Password
                  _PasswordField(
                    controller: _newPasswordController,
                    hintText: "New Password",
                    obscureText: _obscureNew,
                    onToggle: () => setState(() => _obscureNew = !_obscureNew),
                  ),
                  const SizedBox(height: 18),
                  // Confirm New Password
                  _PasswordField(
                    controller: _confirmPasswordController,
                    hintText: "Confirm New Password",
                    obscureText: _obscureConfirm,
                    onToggle:
                        () =>
                            setState(() => _obscureConfirm = !_obscureConfirm),
                    newPasswordController: _newPasswordController,
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF14A388),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      onPressed: _onChangedPassword,
                      child: const Text(
                        "Change Password",
                        style: TextStyle(
                          fontFamily: 'RedditSans',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24), // was 32
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final VoidCallback onToggle;
  final TextEditingController? newPasswordController;

  const _PasswordField({
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.onToggle,
    this.newPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(fontFamily: 'RedditSans', fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'RedditSans',
            color: Colors.black54,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.black45,
            ),
            onPressed: onToggle,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter $hintText";
          }
          if (hintText == "Confirm New Password" &&
              newPasswordController != null) {
            if (value != newPasswordController!.text) {
              return "Passwords do not match";
            }
          }
          return null;
        },
      ),
    );
  }
}
