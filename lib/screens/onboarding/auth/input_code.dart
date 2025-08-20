import 'dart:async';
import 'package:flutter/material.dart';
import 'reset_password.dart';
import 'new_password.dart';

class InputCodeScreen extends StatefulWidget {
  const InputCodeScreen({super.key});

  @override
  State<InputCodeScreen> createState() => _InputCodeScreenState();
}

class _InputCodeScreenState extends State<InputCodeScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  int _resendSeconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() => _resendSeconds = 60);
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendSeconds == 1) {
        timer.cancel();
        setState(() => _resendSeconds = 0);
      } else {
        setState(() => _resendSeconds--);
      }
    });
  }

  void _onResend() {
    if (_resendSeconds == 0) {
      _startTimer();
      // Implement resend logic here if needed
    }
  }

  void _onVerify() {
    // Implement code verification logic if needed
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const NewPasswordScreen()),
    );
  }

  Widget _buildCodeInputBox(int idx) {
    return SizedBox(
      width: 54,
      child: TextField(
        controller: _controllers[idx],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: 'Reddit Sans',
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 17),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
        ),
        onChanged: (val) {
          if (val.length == 1 && idx < 3) {
            FocusScope.of(context).nextFocus();
          }
          if (val.isEmpty && idx > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
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
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ResetPasswordScreen()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3FAF8),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.code, color: greenColor, size: 50),
              ),
              const SizedBox(height: 28),
              const Text(
                "Input Code",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Reddit Sans',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Enter the code sent to your email",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontFamily: 'Reddit Sans',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, _buildCodeInputBox),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  onPressed: _onVerify,
                  child: const Text(
                    "Verify and Proceed",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Reddit Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive code ",
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Reddit Sans',
                    ),
                  ),
                  GestureDetector(
                    onTap: _onResend,
                    child: Text(
                      _resendSeconds == 0
                          ? "Resend"
                          : "Resend ${_resendSeconds}s",
                      style: TextStyle(
                        color: greenColor,
                        fontFamily: 'Reddit Sans',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
