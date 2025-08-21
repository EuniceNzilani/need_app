import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  int _resendSeconds = 0;
  Timer? _timer;
  bool _timerStarted = false;

  static const String inputCodeSvg = '''
<?xml version="1.0"?><svg fill="none" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M5.24923 5C3.454 5 2 6.45538 2 8.25V15.75C2 17.5449 3.45507 19 5.25 19H18.75C20.5449 19 22 17.5449 22 15.75V8.25C22 6.45538 20.546 5 18.7508 5H5.24923ZM6.28021 10.2195L7.00017 10.9392L7.71967 10.2197C8.01256 9.92678 8.48743 9.92678 8.78033 10.2197C9.07322 10.5126 9.07322 10.9874 8.78033 11.2803L8.06108 11.9996L8.7802 12.7184C9.07317 13.0112 9.07328 13.4861 8.78046 13.779C8.48763 14.072 8.01276 14.0721 7.71979 13.7793L7.00042 13.0602L6.28033 13.7803C5.98744 14.0732 5.51256 14.0732 5.21967 13.7803C4.92678 13.4874 4.92678 13.0126 5.21967 12.7197L5.93951 11.9998L5.21979 11.2805C4.92683 10.9876 4.92672 10.5128 5.21954 10.2198C5.51237 9.92683 5.98724 9.92672 6.28021 10.2195ZM11.7802 10.2195L12.5002 10.9392L13.2197 10.2197C13.5126 9.92678 13.9874 9.92678 14.2803 10.2197C14.5732 10.5126 14.5732 10.9874 14.2803 11.2803L13.5611 11.9996L14.2802 12.7184C14.5732 13.0112 14.5733 13.4861 14.2805 13.779C13.9876 14.072 13.5128 14.0721 13.2198 13.7793L12.5004 13.0602L11.7803 13.7803C11.4874 14.0732 11.0126 14.0732 10.7197 13.7803C10.4268 13.4874 10.4268 13.0126 10.7197 12.7197L11.4395 11.9998L10.7198 11.2805C10.4268 10.9876 10.4267 10.5128 10.7195 10.2198C11.0124 9.92683 11.4872 9.92672 11.7802 10.2195ZM15.75 14.25C15.75 13.8358 16.0858 13.5 16.5 13.5H18.25C18.6642 13.5 19 13.8358 19 14.25C19 14.6642 18.6642 15 18.25 15H16.5C16.0858 15 15.75 14.6642 15.75 14.25Z" fill="#14A388"/></svg>
''';

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _resendSeconds = 60;
      _timerStarted = true;
    });
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
          fontFamily: 'RedditSans',
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 17),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          isDense: true,
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
    const Color greenColor = Color(0xFF14A388);
    const Color blueColor = Color(0xFF00659D);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Text(
            "<",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w400,
              fontFamily: 'RedditSans',
            ),
          ),
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
                  color: const Color(0xFFE6F7F4),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: SvgPicture.string(inputCodeSvg, width: 50, height: 50),
              ),
              const SizedBox(height: 28),
              const Text(
                "Input Code",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'RedditSans',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Enter the code sent to your email",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontFamily: 'RedditSans',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Container(
                    width: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: _buildCodeInputBox(index),
                  );
                }),
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
                      fontFamily: 'RedditSans',
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
                      fontFamily: 'RedditSans',
                    ),
                  ),
                  GestureDetector(
                    onTap: _onResend,
                    child: Text(
                      _timerStarted && _resendSeconds > 0
                          ? "Resend in $_resendSeconds"
                          : "Resend",
                      style: TextStyle(
                        color: blueColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'RedditSans',
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
