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
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                labelText: 'Enter calculation',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                try {
                  final result = _calculate(_controller.text);
                  setState(() {
                    _result = result;
                    _error = null;
                  });
                } catch (e) {
                  setState(() {
                    _result = null;
                    _error = e.toString();
                  });
                }
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 16),
            Text(_result != null ? 'Result: $_result' : 'Error: $_error'),
          ],
        ),
      ),
    );
  }

  double _calculate(String calculation) {
    // Implement calculation logic here
    // For example, let's just parse the string as a double
    return double.parse(calculation);
  }
}
