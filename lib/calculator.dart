import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String _expression = '';
  String _result = '';
  bool _isDarkMode = false;

  void _calculate(String expression) {
    try {
      _result = expression.interpret().toString();
    } catch (e) {
      _result = 'Error';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
            ),
          ],
        ),
        body: CalculatorBody(
          expression: _expression,
          result: _result,
          onCalculate: _calculate,
        ),
      ),
    );
  }
}