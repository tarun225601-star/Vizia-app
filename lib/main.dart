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
  String _operator = '';
  double _num1 = 0;
  double _num2 = 0;

  void _calculate() {
    setState(() {
      _num1 = double.parse(_controller.text);
    });

    if (_operator == '+') {
      setState(() {
        _result = _num1 + _num2;
      });
    } else if (_operator == '-') {
      setState(() {
        _result = _num1 - _num2;
      });
    } else if (_operator == '*') {
      setState(() {
        _result = _num1 * _num2;
      });
    } else if (_operator == '/') {
      setState(() {
        _result = _num1 / _num2;
      });
    }

    _controller.text = _result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              readOnly: true,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text = '0';
                      _result = 0;
                      _operator = '';
                      _num1 = 0;
                      _num2 = 0;
                    });
                  },
                  child: const Text('C'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.text = _controller.text.substring(0, _controller.text.length - 1);
                    });
                  },
                  child: const Text('<'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _num2 = double.parse(_controller.text);
                      _operator = '+';
                      _controller.text = '';
                    });
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _num2 = double.parse(_controller.text);
                      _operator = '-';
                      _controller.text = '';
                    });
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _num2 = double.parse(_controller.text);
                      _operator = '*';
                      _controller.text = '';
                    });
                  },
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _num2 = double.parse(_controller.text);
                      _operator = '/';
                      _controller.text = '';
                    });
                  },
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
                  onPressed: _calculate,
                  child: const Text('='),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
              ],
            ),
            const SizedBox(height: 10),
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
              ],
            ),
            const SizedBox(height: 10),
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
                  onPressed: () {
                    setState(() {
                      _controller.text += '.';
                    });
                  },
                  child: const Text('.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
