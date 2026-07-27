import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator App',
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({Key? key}) : super(key: key);

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _expression = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _expression = '';
        _result = '';
      } else if (value == '=') {
        try {
          _result = _calculate(_expression).toString();
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _expression += value;
      }
    });
  }

  double _calculate(String expression) {
    expression = expression.replaceAll('Ã', '*');
    expression = expression.replaceAll('Ã·', '/');
    return _parseExpression(expression);
  }

  double _parseExpression(String expression) {
    expression = expression.replaceAll(' ', '');
    final operators = <String>[];
    final numbers = <double>[];

    final regex = RegExp(r'(\d+(?:\.\d+)?)|([+\-ÃÃ·])');
    final matches = regex.allMatches(expression);

    for (var match in matches) {
      if (match.group(1) != null) {
        numbers.add(double.parse(match.group(1)!));
      } else if (match.group(2) != null) {
        operators.add(match.group(2)!);
      }
    }

    for (int i = 0; i < operators.length; i++) {
      if (operators[i] == 'Ã' || operators[i] == 'Ã·') {
        if (operators[i] == 'Ã') {
          numbers[i] = numbers[i] * numbers[i + 1];
        } else {
          numbers[i] = numbers[i] / numbers[i + 1];
        }
        numbers.removeAt(i + 1);
        operators.removeAt(i);
        i--;
      }
    }

    double result = numbers[0];
    for (int i = 0; i < operators.length; i++) {
      if (operators[i] == '+') {
        result += numbers[i + 1];
      } else if (operators[i] == '-') {
        result -= numbers[i + 1];
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _expression,
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    _result,
                    style: const TextStyle(fontSize: 48),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
              children: [
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('Ã·'),
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('Ã'),
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('-'),
                _buildButton('0'),
                _buildButton('.'),
                _buildButton('C'),
                _buildButton('+'),
                _buildButton('='),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String value) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: value == '=' ? Colors.blueAccent : Colors.blue,
      ),
      onPressed: () => _onButtonPressed(value),
      child: Text(
        value,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}