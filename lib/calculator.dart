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
        _expression = _result;
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
      return expression
          .replaceAll(' ', '')
          .replaceAll('+', '+')
          .replaceAll('-', '-')
          .replaceAll('*', '*')
          .replaceAll('/', '/')
          .eval().toString();
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
              alignment: Alignment.bottomRight,
              child: Text(
                _expression.isEmpty ? '0' : _expression,
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                _result.isEmpty ? '' : _result,
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
              children: [
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '7',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '8',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '9',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '/',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '4',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '5',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '6',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '*',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '1',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '2',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '3',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '-',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '0',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '.',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '=',
                ),
                CalculatorButton(
                  onPressed: _onPressed,
                  value: '+',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}