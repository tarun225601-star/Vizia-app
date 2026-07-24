à¤¯à¤¹à¤¾à¤ à¤¦à¥ à¤à¤²à¤-à¤à¤²à¤ à¤ªà¥à¤°à¤¶à¥à¤¨à¥à¤ à¤à¥ à¤à¤¤à¥à¤¤à¤° à¤¦à¤¿à¤ à¤à¤ à¤¹à¥à¤:


# à¤ªà¤¹à¤²à¤¾ à¤ªà¥à¤°à¤¶à¥à¤¨: à¤à¤ à¤¸à¤¿à¤à¤ªà¤² à¤¡à¤¿à¤à¤¿à¤à¤² à¤à¥à¤²à¥à¤ (Digital Clock) à¤à¤ª à¤¬à¤¨à¤¾à¤¨à¥ à¤à¤¾ à¤¡à¤¾à¤°à¥à¤ à¤à¥à¤¡ (à¤à¥à¤µà¤² lib/main.dart):

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
  String _currentTime = '';
  String _currentDate = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    DateTime now = DateTime.now();
    setState(() {
      _currentTime = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
      _currentDate = '${now.day} ${_getMonth(now.month)} ${now.year}';
    });
    Future.delayed(const Duration(seconds: 1), _updateTime);
  }

  String _getMonth(int month) {
    switch (month) {
      case 1:
        return 'à¤à¤¨à¤µà¤°à¥';
      case 2:
        return 'à¤«à¤°à¤µà¤°à¥';
      case 3:
        return 'à¤®à¤¾à¤°à¥à¤';
      case 4:
        return 'à¤à¤ªà¥à¤°à¥à¤²';
      case 5:
        return 'à¤®à¤';
      case 6:
        return 'à¤à¥à¤¨';
      case 7:
        return 'à¤à¥à¤²à¤¾à¤';
      case 8:
        return 'à¤à¤à¤¸à¥à¤¤';
      case 9:
        return 'à¤¸à¤¿à¤¤à¤à¤¬à¤°';
      case 10:
        return 'à¤à¤à¥à¤à¥à¤¬à¤°';
      case 11:
        return 'à¤¨à¤µà¤à¤¬à¤°';
      case 12:
        return 'à¤¦à¤¿à¤¸à¤à¤¬à¤°';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _currentTime,
                style: const TextStyle(fontSize: 64, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                _currentDate,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



# à¤¦à¥à¤¸à¤°à¤¾ à¤ªà¥à¤°à¤¶à¥à¤¨: à¤ªà¥à¤°à¥à¤£ à¤à¤¿à¤à¤¹à¤¬ à¤à¤à¥à¤¶à¤¨à¥à¤¸ à¤¯à¥à¤®à¤² à¤µà¤°à¥à¤à¤«à¤¼à¥à¤²à¥ à¤«à¤¼à¤¾à¤à¤² à¤¨à¤¾à¤® build.yml:
yml
name: Build and Deploy APK

on:
  workflow_dispatch:
    inputs:
      buildType: { description: 'Build Type', required: false }
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