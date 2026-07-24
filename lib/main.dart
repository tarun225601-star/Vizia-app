import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Calculator(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.deepPurple,
      ),
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
  double? _firstNumber;
  String? _operator;

  void _onTap(String value) {
    setState(() {
      if (value == 'C') {
        _controller.clear();
        _firstNumber = null;
        _operator = null;
      } else if (value == '<') {
        _controller.text = _controller.text.substring(0, _controller.text.length - 1);
      } else if (value == '=') {
        if (_firstNumber != null && _operator != null) {
          final secondNumber = double.parse(_controller.text);
          double result;
          switch (_operator) {
            case '+':
              result = _firstNumber! + secondNumber;
              break;
            case '-':
              result = _firstNumber! - secondNumber;
              break;
            case '*':
              result = _firstNumber! * secondNumber;
              break;
            case '/':
              if (secondNumber != 0) {
                result = _firstNumber! / secondNumber;
              } else {
                result = double.nan;
              }
              break;
            default:
              throw UnimplementedError();
          }
          _controller.text = result.toString();
          _firstNumber = null;
          _operator = null;
        }
      } else if (value == '+' || value == '-' || value == '*' || value == '/') {
        if (_firstNumber == null) {
          _firstNumber = double.parse(_controller.text);
          _operator = value;
          _controller.clear();
        }
      } else {
        _controller.text += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple[600],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    enabled: false,
                    style: const TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(8),
              children: [
                CalculatorButton(
                  onPressed: () => _onTap('7'),
                  child: const Text(
                    '7',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('8'),
                  child: const Text(
                    '8',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('9'),
                  child: const Text(
                    '9',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('/'),
                  child: const Text(
                    '/',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('4'),
                  child: const Text(
                    '4',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('5'),
                  child: const Text(
                    '5',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('6'),
                  child: const Text(
                    '6',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('*'),
                  child: const Text(
                    '*',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('1'),
                  child: const Text(
                    '1',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('2'),
                  child: const Text(
                    '2',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('3'),
                  child: const Text(
                    '3',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('-'),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('0'),
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('.'),
                  child: const Text(
                    '.',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('<'),
                  child: const Text(
                    '<',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('+'),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('C'),
                  child: const Text(
                    'C',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                CalculatorButton(
                  onPressed: () => _onTap('='),
                  child: const Text(
                    '=',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CalculatorButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(50, 50),
        primary: Colors.deepPurple[700],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}