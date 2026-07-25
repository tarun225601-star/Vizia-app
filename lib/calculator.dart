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
      return expression
          .replaceAll(' ', '')
          .replaceAll('+', ' + ')
          .replaceAll('-', ' - ')
          .replaceAll('*', ' * ')
          .replaceAll('/', ' / ')
          .split(' ').join('
')
          .split('
')
          .map((e) => double.parse(e))
          .reduce((value, element) {
            if (expression.contains('+')) {
              return (value + element).toString();
            } else if (expression.contains('-')) {
              return (value - element).toString();
            } else if (expression.contains('*')) {
              return (value * element).toString();
            } else if (expression.contains('/')) {
              return (value / element).toString();
            } else {
              return '';
            }
          })
          .toString();
    } catch (e) {
      return 'Error';
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
            flex: 2,
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