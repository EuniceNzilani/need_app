import 'package:flutter/material.dart';

class InputCodeScreen extends StatefulWidget {
  const InputCodeScreen({Key? key}) : super(key: key);

  @override
  State<InputCodeScreen> createState() => _InputCodeScreenState();
}

class _InputCodeScreenState extends State<InputCodeScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  int _secondsLeft = 60;
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = Ticker(_onTick)..start();
  }

  void _onTick(Duration elapsed) {
    if (_secondsLeft > 0) {
      setState(() {
        _secondsLeft = 60 - elapsed.inSeconds;
      });
    } else {
      _ticker.stop();
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    _ticker.dispose();
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
    // For demonstration, just navigate
    Navigator.pushNamed(context, '/new_password');
  }

  void _onResend() {
    if (_secondsLeft == 0) {
      setState(() {
        _secondsLeft = 60;
        _ticker
          ..stop()
          ..start();
      });
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
          icon: const Text(
            "<",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w400,
            ),
          ),
          onPressed:
              () => Navigator.pushReplacementNamed(
                context,
                '/request_password_change',
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Custom icon box
              Container(
                width: 72,
                height: 72,
                margin: const EdgeInsets.only(bottom: 22),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF2DC5B7), width: 2.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Color(0xFFE7F6F3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.password,
                        size: 28,
                        color: Color(0xFF14A388),
                      ),
                    ),
                  ),
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
                          color: Colors.black.withOpacity(0.07),
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
              Text.rich(
                TextSpan(
                  text: "Didn't receive code ",
                  style: const TextStyle(
                    fontFamily: 'RedditSans',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  children: [
                    WidgetSpan(
                      child: InkWell(
                        onTap: _secondsLeft == 0 ? _onResend : null,
                        child: Text(
                          "Resend ${_secondsLeft}s",
                          style: TextStyle(
                            fontFamily: 'RedditSans',
                            fontSize: 14,
                            color: Color(0xFF14A388),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Simple ticker for countdown
class Ticker {
  final void Function(Duration elapsed) _onTick;
  late final Stopwatch _stopwatch;
  late final TickerFuture _tickerFuture;

  Ticker(this._onTick) {
    _stopwatch = Stopwatch();
  }

  void start() {
    _stopwatch.start();
    _tickerFuture = TickerFuture(_onTick, _stopwatch);
    _tickerFuture._tick();
  }

  void stop() {
    _stopwatch.stop();
  }

  void dispose() {
    _stopwatch.stop();
  }
}

class TickerFuture {
  final void Function(Duration elapsed) _onTick;
  final Stopwatch _stopwatch;
  bool _active = true;

  TickerFuture(this._onTick, this._stopwatch);

  void _tick() async {
    while (_active && _stopwatch.isRunning) {
      await Future.delayed(Duration(seconds: 1));
      _onTick(_stopwatch.elapsed);
    }
  }
}
