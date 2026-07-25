import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _expression = '';
  String _result = '';

  void _onPressed(String value) {
    setState(() {
      if (value == '=') {
        _result = _calculate(_expression);
        _expression = '';
      } else if (value == 'C') {
        _expression = '';
        _result = '';
      } else {
        _expression += value;
      }
    });
  }

  String _calculate(String expression) {
    try {
      return _eval(expression);
    } catch (e) {
      return 'Error';
    }
  }

  String _eval(String expression) {
    // Simple arithmetic expression evaluation
    // This is a very basic implementation and does not handle more complex expressions
    if (expression.contains('+')) {
      final parts = expression.split('+');
      return (double.parse(parts[0]) + double.parse(parts[1])).toString();
    } else if (expression.contains('-')) {
      final parts = expression.split('-');
      return (double.parse(parts[0]) - double.parse(parts[1])).toString();
    } else if (expression.contains('*')) {
      final parts = expression.split('*');
      return (double.parse(parts[0]) * double.parse(parts[1])).toString();
    } else if (expression.contains('/')) {
      final parts = expression.split('/');
      return (double.parse(parts[0]) / double.parse(parts[1])).toString();
    } else {
      return '0';
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
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _expression + (_result.isNotEmpty ? '=' + _result : ''),
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            childAspectRatio: 1.2,
            children: [
              _buildButton('7', _onPressed),
              _buildButton('8', _onPressed),
              _buildButton('9', _onPressed),
              _buildButton('/', _onPressed),
              _buildButton('4', _onPressed),
              _buildButton('5', _onPressed),
              _buildButton('6', _onPressed),
              _buildButton('*', _onPressed),
              _buildButton('1', _onPressed),
              _buildButton('2', _onPressed),
              _buildButton('3', _onPressed),
              _buildButton('-', _onPressed),
              _buildButton('0', _onPressed),
              _buildButton('.', _onPressed),
              _buildButton('=', _onPressed),
              _buildButton('+', _onPressed),
              _buildButton('C', _onPressed),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String value, Function onPressed) {
    return ElevatedButton(
      onPressed: () => onPressed(value),
      child: Text(value),
    );
  }
}