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
  double? _result;

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
                hintText: 'Enter a math expression',
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
            Text(_result != null ? 'Result: $_result' : 'Result:'),
          ],
        ),
      ),
    );
  }

  double eval(String expression) {
    // Implement a simple math expression evaluator
    // For example, using the 'expr' package
    // https://pub.dev/packages/expr
    return 0;
  }
}