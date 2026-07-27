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
  String _expression = '';
  String _result = '';

  void _clear() {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  void _delete() {
    setState(() {
      if (_expression.isNotEmpty) {
        _expression = _expression.substring(0, _expression.length - 1);
        _result = '';
      }
    });
  }

  void _calculate() {
    try {
      setState(() {
        _result = _calculateExpression(_expression);
      });
    } catch (e) {
      setState(() {
        _result = 'Error';
      });
    }
  }

  String _calculateExpression(String expression) {
    final exp = RegExp(r'([0-9]+(\.[0-9]+)?|[+-/*()])');
    final tokens = exp.allMatches(expression).map((m) => m.group(0)).toList();

    int pos = 0;

    double _parseFactor() {
      if (tokens[pos] == '(') {
        pos++;
        final result = _parseExpression();
        if (tokens[pos] != ')') {
          throw Exception('Unbalanced parentheses');
        }
        pos++;
        return result;
      } else {
        final value = double.parse(tokens[pos]);
        pos++;
        return value;
      }
    }

    double _parseTerm() {
      double result = _parseFactor();
      while (pos < tokens.length && (tokens[pos] == '*' || tokens[pos] == '/')) {
        final op = tokens[pos];
        pos++;
        final factor = _parseFactor();
        if (op == '*') {
          result *= factor;
        } else {
          if (factor == 0) {
            throw Exception('Division by zero');
          }
          result /= factor;
        }
      }
      return result;
    }

    double _parseExpression() {
      double result = _parseTerm();
      while (pos < tokens.length && (tokens[pos] == '+' || tokens[pos] == '-')) {
        final op = tokens[pos];
        pos++;
        final term = _parseTerm();
        if (op == '+') {
          result += term;
        } else {
          result -= term;
        }
      }
      return result;
    }

    return _parseExpression().toString();
  }

  void _append(String text) {
    setState(() {
      _expression += text;
    });
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
                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                CalculatorButton(
                  text: '7',
                  onPressed: () => _append('7'),
                ),
                CalculatorButton(
                  text: '8',
                  onPressed: () => _append('8'),
                ),
                CalculatorButton(
                  text: '9',
                  onPressed: () => _append('9'),
                ),
                CalculatorButton(
                  text: '/',
                  onPressed: () => _append('/'),
                ),
                CalculatorButton(
                  text: '4',
                  onPressed: () => _append('4'),
                ),
                CalculatorButton(
                  text: '5',
                  onPressed: () => _append('5'),
                ),
                CalculatorButton(
                  text: '6',
                  onPressed: () => _append('6'),
                ),
                CalculatorButton(
                  text: '*',
                  onPressed: () => _append('*'),
                ),
                CalculatorButton(
                  text: '1',
                  onPressed: () => _append('1'),
                ),
                CalculatorButton(
                  text: '2',
                  onPressed: () => _append('2'),
                ),
                CalculatorButton(
                  text: '3',
                  onPressed: () => _append('3'),
                ),
                CalculatorButton(
                  text: '-',
                  onPressed: () => _append('-'),
                ),
                CalculatorButton(
                  text: '0',
                  onPressed: () => _append('0'),
                ),
                CalculatorButton(
                  text: '.',
                  onPressed: () => _append('.'),
                ),
                CalculatorButton(
                  text: '=',
                  onPressed: _calculate,
                ),
                CalculatorButton(
                  text: '+',
                  onPressed: () => _append('+'),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CalculatorButton(
                  text: 'Clear',
                  onPressed: _clear,
                ),
              ),
              Expanded(
                child: CalculatorButton(
                  text: 'Delete',
                  onPressed: _delete,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}