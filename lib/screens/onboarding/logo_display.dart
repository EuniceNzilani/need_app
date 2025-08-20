import 'dart:async';
import 'package:flutter/material.dart';

class LogoDisplay extends StatefulWidget {
  const LogoDisplay({Key? key}) : super(key: key);

  @override
  State<LogoDisplay> createState() => _LogoDisplayState();
}

class _LogoDisplayState extends State<LogoDisplay> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/app_goals');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image(image: AssetImage('Assets/logo.jpg'))),
    );
  }
}
