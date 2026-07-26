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
  String _operator = '';
  double _num1 = 0;
  double _num2 = 0;

  void _calculate(String operator) {
    setState(() {
      _num1 = double.parse(_controller.text);
      _operator = operator;
      _controller.clear();
    });
  }

  void _equal() {
    setState(() {
      _num2 = double.parse(_controller.text);
      switch (_operator) {
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.text += '7',
                  child: const Text('7'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text += '8',
                  child: const Text('8'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text += '9',
                  child: const Text('9'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.text += '4',
                  child: const Text('4'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text += '5',
                  child: const Text('5'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text += '6',
                  child: const Text('6'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  child: const Text('*'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.text += '1',
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text += '2',
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text += '3',
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: const Text('-'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.text += '0',
                  child: const Text('0'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.clear(),
                  child: const Text('C'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text += '.',
                  child: const Text('.'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: const Text('+'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _equal,
                  child: const Text('='),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
