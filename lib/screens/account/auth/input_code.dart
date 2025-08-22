import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Import actual screens using relative paths
import 'new_password.dart';
import 'request_password_change.dart';

class InputCodeScreen extends StatefulWidget {
  const InputCodeScreen({super.key});

  @override
  State<InputCodeScreen> createState() => _InputCodeScreenState();
}

class _InputCodeScreenState extends State<InputCodeScreen>
    with SingleTickerProviderStateMixin {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  int _secondsLeft = 60;
  Ticker? _ticker;

  static const String customSvg = '''
<?xml version="1.0"?>
<svg fill="none" height="52" viewBox="0 0 24 24" width="52" xmlns="http://www.w3.org/2000/svg">
<path d="M5.24923 5C3.454 5 2 6.45538 2 8.25V15.75C2 17.5449 3.45507 19 5.25 19H18.75C20.5449 19 22 17.5449 22 15.75V8.25C22 6.45538 20.546 5 18.7508 5H5.24923ZM6.28021 10.2195L7.00017 10.9392L7.71967 10.2197C8.01256 9.92678 8.48743 9.92678 8.78033 10.2197C9.07322 10.5126 9.07322 10.9874 8.78033 11.2803L8.06108 11.9996L8.7802 12.7184C9.07317 13.0112 9.07328 13.4861 8.78046 13.779C8.48763 14.072 8.01276 14.0721 7.71979 13.7793L7.00042 13.0602L6.28033 13.7803C5.98744 14.0732 5.51256 14.0732 5.21967 13.7803C4.92678 13.4874 4.92678 13.0126 5.21967 12.7197L5.93951 11.9998L5.21979 11.2805C4.92683 10.9876 4.92672 10.5128 5.21954 10.2198C5.51237 9.92683 5.98724 9.92672 6.28021 10.2195ZM11.7802 10.2195L12.5002 10.9392L13.2197 10.2197C13.5126 9.92678 13.9874 9.92678 14.2803 10.2197C14.5732 10.5126 14.5732 10.9874 14.2803 11.2803L13.5611 11.9996L14.2802 12.7184C14.5732 13.0112 14.5733 13.4861 14.2805 13.779C13.9876 14.072 13.5128 14.0721 13.2198 13.7793L12.5004 13.0602L11.7803 13.7803C11.4874 14.0732 11.0126 14.0732 10.7197 13.7803C10.4268 13.4874 10.4268 13.0126 10.7197 12.7197L11.4395 11.9998L10.7198 11.2805C10.4268 10.9876 10.4267 10.5128 10.7195 10.2198C11.0124 9.92683 11.4872 9.92672 11.7802 10.2195ZM15.75 14.25C15.75 13.8358 16.0858 13.5 16.5 13.5H18.25C18.6642 13.5 19 13.8358 19 14.25C19 14.6642 18.6642 15 18.25 15H16.5C16.0858 15 15.75 14.6642 15.75 14.25Z" fill="#14A388"/>
</svg>
''';

  static const Color resendBlue = Color(0xFF00659D);

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _ticker?.dispose();
    _secondsLeft = 60;
    _ticker = createTicker((elapsed) {
      if (_secondsLeft > 0) {
        setState(() {
          _secondsLeft = 60 - elapsed.inSeconds;
        });
      } else {
        _ticker?.stop();
        setState(() {});
      }
    });
    _ticker?.start();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    _ticker?.dispose();
    super.dispose();
  }

  void _onCodeChanged(int idx, String value) {
    if (value.length == 1 && idx < 3) {
      _focusNodes[idx + 1].requestFocus();
    }
    if (value.isEmpty && idx > 0) {
      _focusNodes[idx - 1].requestFocus();
    }
  }

  void _onVerify() {
    // Navigate directly to the new password screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewPasswordScreen()),
    );
  }

  void _onResend() {
    if (_secondsLeft == 0) {
      _startTimer();
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
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const RequestPasswordChangeScreen(),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // SVG Icon box without green border
              Container(
                width: 72,
                height: 72,
                margin: const EdgeInsets.only(bottom: 22),
                decoration: BoxDecoration(
                  color: Color(0xFFE7F6F3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SvgPicture.string(customSvg, width: 52, height: 52),
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                "Input Code",
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              const Text(
                "Enter the code sent to your number",
                style: TextStyle(
                  fontFamily: 'RedditSans',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (idx) {
                  return Container(
                    width: 48,
                    height: 48,
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(18),
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: TextField(
                        controller: _controllers[idx],
                        focusNode: _focusNodes[idx],
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontFamily: 'RedditSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        onChanged: (value) => _onCodeChanged(idx, value),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF14A388),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                  ),
                  onPressed: _onVerify,
                  child: const Text(
                    "Verify and Proceed",
                    style: TextStyle(
                      fontFamily: 'RedditSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
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
                      fontFamily: 'RedditSans',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: _secondsLeft == 0 ? _onResend : null,
                    child: Text(
                      _secondsLeft == 0 ? "Resend" : "Resend ${_secondsLeft}s",
                      style: TextStyle(
                        fontFamily: 'RedditSans',
                        fontSize: 14,
                        color: resendBlue,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w600,
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
