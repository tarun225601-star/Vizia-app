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
      return (Function.apply(eval, [expression])).toString();
    } catch (e) {
      return 'Error';
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
            child: Container(
              padding: const EdgeInsets.all(20),
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
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String value) {
    return ElevatedButton(
      onPressed: () => _onPressed(value),
      child: Text(
        value,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}