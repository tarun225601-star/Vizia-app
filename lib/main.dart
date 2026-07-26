import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Simple Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _controller = TextEditingController();
  String _result = '';

  void _calculate(String operator) {
    setState(() {
      if (operator == '=') {
        _result = _calculateResult(_controller.text);
      } else {
        _controller.text += operator;
      }
    });
  }

  String _calculateResult(String expression) {
    try {
      return expression
          .replaceAll(' ', '')
          .split('
')
          .map((e) => e
              .replaceAll('+', ' + ')
              .replaceAll('-', ' - ')
              .replaceAll('*', ' * ')
              .replaceAll('/', ' / ')
              .split(' ')
              .map((e) => double.parse(e))
              .reduce((value, element) {
                switch (expression
                    .replaceAll(' ', '')
                    .split('
')[0]
                    .split(RegExp(r'\d+'))
                    .last) {
                  case '+':
                    return value + element;
                  case '-':
                    return value - element;
                  case '*':
                    return value * element;
                  case '/':
                    return value / element;
                  default:
                    return 0;
                }
              }))
          .join('
');
    } catch (e) {
      return 'Error';
    }
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
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter expression',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _calculate('='),
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 16),
            Text(_result),
          ],
        ),
      ),
    );
  }
}