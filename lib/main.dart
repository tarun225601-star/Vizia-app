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
  String _expression = '';
  String _result = '';

  void _calculate(String expression) {
    try {
      _result = expression;
    } catch (e) {
      _result = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    _expression,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _result,
                    style: const TextStyle(fontSize: 48),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '7';
                    });
                  },
                  child: const Text('7'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '8';
                    });
                  },
                  child: const Text('8'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '9';
                    });
                  },
                  child: const Text('9'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '/';
                    });
                  },
                  child: const Text('/'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '4';
                    });
                  },
                  child: const Text('4'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '5';
                    });
                  },
                  child: const Text('5'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '6';
                    });
                  },
                  child: const Text('6'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '*';
                    });
                  },
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '1';
                    });
                  },
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '2';
                    });
                  },
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '3';
                    });
                  },
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '-';
                    });
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '0';
                    });
                  },
                  child: const Text('0'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '.';
                    });
                  },
                  child: const Text('.'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '=';
                      _calculate(_expression);
                    });
                  },
                  child: const Text('='),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _expression += '+';
                    });
                  },
                  child: const Text('+'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
