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
  final _controller = TextEditingController(text: '0');
  double _result = 0;
  String _operation = '';
  double _num1 = 0;
  double _num2 = 0;

  void _calculate(String operation) {
    setState(() {
      _num1 = double.parse(_controller.text);
      _operation = operation;
    });
  }

  void _equals() {
    setState(() {
      _num2 = double.parse(_controller.text);
      switch (_operation) {
        case '+':
          _result = _num1 + _num2;
          break;
        case '-':
          _result = _num1 - _num2;
          break;
        case '*':
          _result = _num1 * _num2;
          break;
        case '/':
          _result = _num1 / _num2;
          break;
      }
      _controller.text = _result.toString();
    });
  }

  void _clear() {
    setState(() {
      _controller.text = '0';
      _result = 0;
      _operation = '';
      _num1 = 0;
      _num2 = 0;
    });
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
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _equals,
                  child: const Text('='),
                ),
                ElevatedButton(
                  onPressed: _clear,
                  child: const Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
