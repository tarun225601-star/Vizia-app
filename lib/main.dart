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

  void _calculate() {
    setState(() {
      _num1 = double.parse(_controller.text);
      if (_operation == '+') {
        _result = _num1 + _num2;
      } else if (_operation == '-') {
        _result = _num1 - _num2;
      } else if (_operation == '*') {
        _result = _num1 * _num2;
      } else if (_operation == '/') {
        _result = _num1 / _num2;
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

  void _setOperation(String op) {
    setState(() {
      _num2 = double.parse(_controller.text);
      _operation = op;
      _controller.text = '0';
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
                  onPressed: () => _setOperation('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _setOperation('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _setOperation('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _setOperation('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.text = _controller.text + '7',
                  child: const Text('7'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text = _controller.text + '8',
                  child: const Text('8'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text = _controller.text + '9',
                  child: const Text('9'),
                ),
                ElevatedButton(
                  onPressed: _calculate,
                  child: const Text('='),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.text = _controller.text + '4',
                  child: const Text('4'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text = _controller.text + '5',
                  child: const Text('5'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text = _controller.text + '6',
                  child: const Text('6'),
                ),
                ElevatedButton(
                  onPressed: _clear,
                  child: const Text('C'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.text = _controller.text + '1',
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text = _controller.text + '2',
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text = _controller.text + '3',
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.text = _controller.text + '0',
                  child: const Text('0'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
