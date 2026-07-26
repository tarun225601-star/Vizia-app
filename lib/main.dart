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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter expression',
              ),
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            Text(_result != null ? 'Result: $_result' : 'Result: ')
          ],
        ),
      ),
    );
  }

  double eval(String expression) {
    // Implement your calculator logic here
    // For simplicity, let's assume we only support addition and subtraction
    final parts = expression.split('+');
    if (parts.length > 1) {
      double sum = 0;
      for (var part in parts) {
        sum += double.parse(part);
      }
      return sum;
    }
    parts = expression.split('-');
    if (parts.length > 1) {
      double diff = double.parse(parts[0]);
      for (var i = 1; i < parts.length; i++) {
        diff -= double.parse(parts[i]);
      }
      return diff;
    }
    throw Exception('Unsupported operation');
  }
}