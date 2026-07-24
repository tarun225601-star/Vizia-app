import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color(0xFF2F343A),
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _expression = '';
  String _result = '0';

  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _expression = '';
        _result = '0';
      } else if (value == '=') {
        try {
          _result = _calculate(_expression).toString();
          _expression = _result;
        } catch (e) {
          _result = 'Error';
          _expression = '';
        }
      } else {
        if (_expression.isEmpty && value == '0') {
          _expression = '';
        } else {
          _expression += value;
        }
      }
    });
  }

  double _calculate(String expression) {
    try {
      return double.parse(expression);
    } on FormatException {
      try {
        return _calculateSimpleExpression(expression);
      } on FormatException {
        rethrow;
      }
    }
  }

  double _calculateSimpleExpression(String expression) {
    final operators = <String>['+', '-', '*', '/'];
    for (var i = 0; i < operators.length; i++) {
      final operator = operators[i];
      final indexOfOperator = expression.lastIndexOf(operator);
      if (indexOfOperator != -1) {
        final left = expression.substring(0, indexOfOperator);
        final right = expression.substring(indexOfOperator + 1);
        try {
          double leftNumber = double.parse(left);
          double rightNumber = double.parse(right);
          double result;
          switch (operator) {
            case '+':
              result = leftNumber + rightNumber;
              break;
            case '-':
              result = leftNumber - rightNumber;
              break;
            case '*':
              result = leftNumber * rightNumber;
              break;
            case '/':
              if (rightNumber == 0) {
                throw FormatException('Division by zero');
              }
              result = leftNumber / rightNumber;
              break;
            default:
              throw FormatException('Unknown operator');
          }
          return result;
        } on FormatException {
          throw FormatException('Invalid expression');
        }
      }
    }
    throw FormatException('Invalid expression');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    _expression.isEmpty ? _result : _expression,
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF454F55),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('7'),
                          child: const Text('7'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF454F55),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('8'),
                          child: const Text('8'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF454F55),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('9'),
                          child: const Text('9'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF666666),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('/'),
                          child: const Text('/'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF454F55),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('4'),
                          child: const Text('4'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF454F55),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('5'),
                          child: const Text('5'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF454F55),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('6'),
                          child: const Text('6'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF666666),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('*'),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF454F55),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('1'),
                          child: const Text('1'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF454F55),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('2'),
                          child: const Text('2'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF454F55),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('3'),
                          child: const Text('3'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF666666),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('-'),
                          child: const Text('-'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF454F55),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('0'),
                          child: const Text('0'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF454F55),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('C'),
                          child: const Text('C'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF454F55),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('='),
                          child: const Text('='),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF666666),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () => _onPressed('+'),
                          child: const Text('+'),
                        ),
                      ),
                    ],
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