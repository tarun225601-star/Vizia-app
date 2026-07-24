à¤à¤ªà¤à¥ à¤à¤µà¤¶à¥à¤¯à¤à¤¤à¤¾ à¤à¥ à¤à¤¨à¥à¤¸à¤¾à¤°, à¤®à¥à¤ à¤à¤ªà¤à¥ à¤à¤ à¤¸à¤¿à¤à¤ªà¤² à¤¡à¤¿à¤à¤¿à¤à¤² à¤à¥à¤²à¥à¤ à¤à¤ªà¥à¤²à¥à¤à¥à¤¶à¤¨ à¤à¤¾ à¤«à¥à¤°à¤à¤à¤à¤à¤¡ à¤à¥à¤¡ à¤¨à¤¹à¥à¤ à¤¦à¥ à¤¸à¤à¤¤à¤¾ à¤à¥à¤¯à¥à¤à¤à¤¿ à¤à¤ªà¤¨à¥ à¤¡à¤¾à¤°à¥à¤ (Dart) à¤ªà¥à¤°à¥à¤à¥à¤°à¤¾à¤®à¤¿à¤à¤ à¤­à¤¾à¤·à¤¾ à¤à¤¾ à¤à¤²à¥à¤²à¥à¤ à¤à¤¿à¤¯à¤¾ à¤¹à¥à¥¤ à¤à¤¸à¤²à¤¿à¤, à¤®à¥à¤ à¤à¤ªà¤à¥ à¤à¤ à¤¸à¤¿à¤à¤ªà¤² à¤¡à¤¿à¤à¤¿à¤à¤² à¤à¥à¤²à¥à¤ à¤à¤ªà¥à¤²à¥à¤à¥à¤¶à¤¨ à¤à¤¾ à¤¡à¤¾à¤°à¥à¤ à¤à¥à¤¡ à¤ªà¥à¤°à¤¦à¤¾à¤¨ à¤à¤°à¥à¤à¤à¤¾ à¤à¥ à¤«à¥à¤²à¤à¤° à¤«à¥à¤°à¥à¤®à¤µà¤°à¥à¤ à¤à¤¾ à¤à¤ªà¤¯à¥à¤ à¤à¤°à¤¤à¤¾ à¤¹à¥:


import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DigitalClock(),
    );
  }
}

class DigitalClock extends StatefulWidget {
  const DigitalClock({Key? key}) : super(key: key);

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  String _time = '';
  String _date = '';

  void _updateTime() {
    setState(() {
      _time = DateTime.now().toString().split(' ')[1];
      _date = DateTime.now().toString().split(' ')[0];
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F2F2F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _time,
              style: const TextStyle(
                fontSize: 64,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _date,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}