import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Simple Calculator',
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
  final _textController = TextEditingController();
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';
  String _result = '';

  void _calculateResult() {
    setState(() {
      switch (_operator) {
        case '+':
          _result = (_num1 + _num2).toStringAsFixed(2);
          break;
        case '-':
          _result = (_num1 - _num2).toStringAsFixed(2);
          break;
        case '*':
          _result = (_num1 * _num2).toStringAsFixed(2);
          break;
        case '/':
          if (_num2 != 0) {
            _result = (_num1 / _num2).toStringAsFixed(2);
          } else {
            _result = 'Error: Division by zero';
          }
          break;
        default:
          _result = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter numbers and operator (e.g., 10+20)',
              ),
              onChanged: (value) {
                final parts = value.split(RegExp(r'[\+\-\*\/]'));
                if (parts.length == 2) {
                  try {
                    _num1 = double.parse(parts[0]);
                    _num2 = double.parse(parts[1]);
                    _operator = value.substring(parts[0].length, parts[0].length + 1);
                    _calculateResult();
                  } catch (e) {
                    _result = 'Invalid input';
                  }
                } else {
                  _result = '';
                }
              },
            ),
            const SizedBox(height: 16),
            Text(
              _result.isEmpty ? 'Result: ' : 'Result: $_result',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}