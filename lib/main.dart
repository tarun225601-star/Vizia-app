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
  double _num1 = 0;
  double _num2 = 0;

  void _calculate() {
    setState(() {
      _num1 = double.parse(_controller.text);
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
        default:
          _result = 0;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '7';
                    });
                  },
                  child: const Text('7'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '8';
                    });
                  },
                  child: const Text('8'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '9';
                    });
                  },
                  child: const Text('9'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '/';
                      _operation = '/';
                      _num2 = double.parse(_controller.text.substring(0, _controller.text.length - 1));
                    });
                  },
                  child: const Text('/'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '4';
                    });
                  },
                  child: const Text('4'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '5';
                    });
                  },
                  child: const Text('5'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '6';
                    });
                  },
                  child: const Text('6'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '*';
                      _operation = '*';
                      _num2 = double.parse(_controller.text.substring(0, _controller.text.length - 1));
                    });
                  },
                  child: const Text('*'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '1';
                    });
                  },
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '2';
                    });
                  },
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '3';
                    });
                  },
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '-';
                      _operation = '-';
                      _num2 = double.parse(_controller.text.substring(0, _controller.text.length - 1));
                    });
                  },
                  child: const Text('-'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '0';
                    });
                  },
                  child: const Text('0'),
                ),
                ElevatedButton(
                  onPressed: _clear,
                  child: const Text('C'),
                ),
                ElevatedButton(
                  onPressed: _calculate,
                  child: const Text('='),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text += '+';
                      _operation = '+';
                      _num2 = double.parse(_controller.text.substring(0, _controller.text.length - 1));
                    });
                  },
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
