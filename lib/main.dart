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
  String _currentInput = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _currentInput = '';
        _result = '';
      } else if (value == '=') {
        _result = _calculateResult(_currentInput);
      } else {
        _currentInput += value;
      }
    });
  }

  String _calculateResult(String input) {
    try {
      return input
          .replaceAll(' ', '')
          .split('
')
          .map((exp) => _calculateExpression(exp))
          .join('
');
    } catch (e) {
      return 'Error';
    }
  }

  double _calculateExpression(String expression) {
    try {
      return double.parse(expression);
    } catch (e) {
      try {
        return _calculateAdvancedExpression(expression);
      } catch (e) {
        return double.nan;
      }
    }
  }

  double _calculateAdvancedExpression(String expression) {
    try {
      return double.parse(expression);
    } catch (e) {
      if (expression.contains('+')) {
        final parts = expression.split('+');
        return double.parse(parts[0]) + double.parse(parts[1]);
      } else if (expression.contains('-')) {
        final parts = expression.split('-');
        return double.parse(parts[0]) - double.parse(parts[1]);
      } else if (expression.contains('*')) {
        final parts = expression.split('*');
        return double.parse(parts[0]) * double.parse(parts[1]);
      } else if (expression.contains('/')) {
        final parts = expression.split('/');
        return double.parse(parts[0]) / double.parse(parts[1]);
      } else {
        throw Exception('Unsupported operation');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                _result.isEmpty ? _currentInput : _result,
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
              children: [
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('/'),
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('*'),
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('-'),
                _buildButton('0'),
                _buildButton('.'),
                _buildButton('='),
                _buildButton('+'),
                _buildButton('C'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String value) {
    return GestureDetector(
      onTap: () => _onButtonPressed(value),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
