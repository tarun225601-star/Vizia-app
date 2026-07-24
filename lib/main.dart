à¤¯à¤¹à¤¾à¤ à¤à¤ à¤¸à¤¿à¤à¤ªà¤² à¤¡à¤¿à¤à¤¿à¤à¤² à¤à¥à¤²à¥à¤ (Digital Clock) à¤à¤ª à¤à¥ à¤²à¤¿à¤ à¤¡à¤¾à¤°à¥à¤ à¤à¥à¤¡ à¤¹à¥:


import 'dart:async';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _getTime();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _getTime();
    });
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String time = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
    final String date = '${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}';
    setState(() {
      _time = time;
      _date = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _time,
              style: const TextStyle(
                fontSize: 64,
                color: Colors.white,
                fontWeight: FontWeight.bold,
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


à¤¯à¤¹ à¤à¥à¤¡ à¤à¤ à¤¸à¤¾à¤§à¤¾à¤°à¤£ à¤¡à¤¿à¤à¤¿à¤à¤² à¤à¤¡à¤¼à¥ à¤¬à¤¨à¤¾à¤¤à¤¾ à¤¹à¥ à¤à¤¿à¤¸à¤®à¥à¤ à¤²à¤¾à¤à¤µ à¤¸à¤®à¤¯ à¤à¤° à¤à¤ à¤à¥ à¤¤à¤¾à¤°à¥à¤ à¤¦à¤¿à¤à¤¾à¤ à¤¦à¥à¤¤à¥ à¤¹à¥à¥¤ à¤¯à¤¹ à¤¡à¤¾à¤°à¥à¤ à¤®à¥à¤¡ à¤®à¥à¤ à¤¹à¥ à¤à¤° à¤®à¥à¤¬à¤¾à¤à¤²-à¤«à¥à¤°à¥à¤à¤¡à¤²à¥ à¤¹à¥à¥¤

à¤à¤¬, à¤¯à¤¹à¤¾à¤ à¤à¤à¤ªà¥à¤²à¥à¤ à¤à¤¿à¤à¤¹à¤¬ à¤à¤à¥à¤¶à¤¨à¥à¤¸ à¤¯à¤¾à¤®à¤² à¤µà¤°à¥à¤à¤«à¤¼à¥à¤²à¥ à¤«à¤¼à¤¾à¤à¤² à¤¹à¥:

yml
name: Build APK

on:
  workflow_dispatch:
    inputs:
      client_payload: {description: 'Client payload', required: false}
  repository_dispatch:
    types: [build_apk_trigger]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Set up Java
        uses: actions/setup-java@v3
        with:
          java-version: '17'
          distribution: 'temurin'

      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: 'stable'

      - name: Get dependencies
        run: flutter pub get

      - name: Build APK
        run: flutter build apk --release