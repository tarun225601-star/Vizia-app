import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator',
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
  double? _currentValue;
  String? _operation;
  double? _previousValue;

  void _handleClick(String value) {
    setState(() {
      if (value == 'C') {
        _controller.text = '0';
        _currentValue = null;
        _operation = null;
        _previousValue = null;
      } else if (value == '+' || value == '-' || value == '*' || value == '/') {
        _previousValue = double.parse(_controller.text);
        _operation = value;
        _controller.text = '0';
      } else if (value == '=') {
        if (_operation != null && _previousValue != null) {
          _currentValue = double.parse(_controller.text);
          switch (_operation) {
            case '+':
              _controller.text = (_previousValue! + _currentValue!).toString();
              break;
            case '-':
              _controller.text = (_previousValue! - _currentValue!).toString();
              break;
            case '*':
              _controller.text = (_previousValue! * _currentValue!).toString();
              break;
            case '/':
              if (_currentValue! != 0) {
                _controller.text = (_previousValue! / _currentValue!).toString();
              } else {
                _controller.text = 'Error';
              }
              break;
          }
        }
      } else {
        if (_controller.text == '0') {
          _controller.text = value;
        } else {
          _controller.text += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                readOnly: true,
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1,
              children: [
                ElevatedButton(
                  onPressed: () => _handleClick('7'),
                  child: const Text('7'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('8'),
                  child: const Text('8'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('9'),
                  child: const Text('9'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('/'),
                  child: const Text('/'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('4'),
                  child: const Text('4'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('5'),
                  child: const Text('5'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('6'),
                  child: const Text('6'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('1'),
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('2'),
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('3'),
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('0'),
                  child: const Text('0'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('.'),
                  child: const Text('.'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('='),
                  child: const Text('='),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _handleClick('C'),
                  child: const Text('C'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}