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
  final _controller = TextEditingController();
  String _result = '';

  void _calculate(String operation) {
    setState(() {
      if (operation == '=') {
        try {
          _result = _calculateResult(_controller.text);
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _controller.text += operation;
      }
    });
  }

  String _calculateResult(String expression) {
    try {
      return (eval(expression)).toString();
    } catch (e) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('7'),
                  child: const Text('7'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _calculate('8'),
                  child: const Text('8'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _calculate('9'),
                  child: const Text('9'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('4'),
                  child: const Text('4'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _calculate('5'),
                  child: const Text('5'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _calculate('6'),
                  child: const Text('6'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  child: const Text('*'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('1'),
                  child: const Text('1'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _calculate('2'),
                  child: const Text('2'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _calculate('3'),
                  child: const Text('3'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: const Text('-'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('0'),
                  child: const Text('0'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _calculate('.'),
                  child: const Text('.'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _calculate('='),
                  child: const Text('='),
                ),
                const SizedBox(width: 8),
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
