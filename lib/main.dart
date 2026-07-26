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
    // Implement your expression evaluation logic here
    // For simplicity, let's assume we're just parsing a simple math expression
    // without any advanced logic or error handling.
    return double.parse(expression);
  }
}