import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator App',
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({Key? key}) : super(key: key);

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _display = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';

  void _onClick(String value) {
    setState(() {
      if (value == 'C') {
        _display = '';
        _num1 = 0;
        _num2 = 0;
        _operator = '';
      } else if (value == '+' || value == '-' || value == '*' || value == '/') {
        _num1 = double.parse(_display);
        _operator = value;
        _display = '';
      } else if (value == '=') {
        _num2 = double.parse(_display);
        if (_operator == '+') {
          _display = (_num1 + _num2).toString();
        } else if (_operator == '-') {
          _display = (_num1 - _num2).toString();
        } else if (_operator == '*') {
          _display = (_num1 * _num2).toString();
        } else if (_operator == '/') {
          _display = (_num1 / _num2).toString();
        }
      } else {
        _display += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              _display,
              style: const TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
              children: [
                ElevatedButton(
                  onPressed: () => _onClick('7'),
                  child: const Text('7'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('8'),
                  child: const Text('8'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('9'),
                  child: const Text('9'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('/'),
                  child: const Text('/'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('4'),
                  child: const Text('4'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('5'),
                  child: const Text('5'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('6'),
                  child: const Text('6'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('1'),
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('2'),
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('3'),
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('0'),
                  child: const Text('0'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('.'),
                  child: const Text('.'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('='),
                  child: const Text('='),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('C'),
                  child: const Text('C'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
