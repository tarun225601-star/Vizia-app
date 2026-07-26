import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator App',
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = TextEditingController();
  double? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter expression',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                try {
                  _result = eval(_controller.text);
                  setState(() {});
                } catch (e) {
                  _result = null;
                  setState(() {});
                }
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            Text(_result != null ? 'Result: $_result' : 'Result: ')
          ],
        ),
      ),
    );
  }

  double eval(String expression) {
    // Simple expression evaluation, does not handle complex expressions
    final parts = expression.split(' ');
    if (parts.length != 3) {
      throw Exception('Invalid expression');
    }
    final num1 = double.parse(parts[0]);
    final operator = parts[1];
    final num2 = double.parse(parts[2]);

    switch (operator) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '*':
        return num1 * num2;
      case '/':
        if (num2 == 0) {
          throw Exception('Division by zero');
        }
        return num1 / num2;
      default:
        throw Exception('Invalid operator');
    }
  }
}