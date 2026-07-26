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
  final _controller = TextEditingController(text: '0');
  double _result = 0;
  String _operation = '';

  void _calculate(String operation) {
    setState(() {
      if (operation == '=') {
        _result = _calculateResult(_controller.text);
        _controller.text = _result.toString();
      } else {
        _operation = operation;
        _controller.text += operation;
      }
    });
  }

  double _calculateResult(String expression) {
    // Implement your calculation logic here
    return 0;
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
              readOnly: true,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              childAspectRatio: 1,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('7'),
                  child: const Text('7'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('8'),
                  child: const Text('8'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('9'),
                  child: const Text('9'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: const Text('/'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('4'),
                  child: const Text('4'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('5'),
                  child: const Text('5'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('6'),
                  child: const Text('6'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('1'),
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('2'),
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('3'),
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('0'),
                  child: const Text('0'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('.'),
                  child: const Text('.'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('='),
                  child: const Text('='),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: const Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
