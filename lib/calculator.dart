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
          .split('
')
          .map((e) => e
              .replaceAll('+', '+')
              .replaceAll('-', '-')
              .replaceAll('*', '*')
              .replaceAll('/', '/'))
          .join('
')
          .split('
')
          .map((e) => e
              .contains(RegExp(r'[+*/-]'))
              ? (()
              async {
                var result = await compute(_calculateExpression, e);
                return result.toString();
              })()
              : e)
          .join('
');
    } catch (e) {
      return 'Error';
    }
  }

  Future<String> _calculateExpression(String expression) async {
    try {
      return (await Future.delayed(const Duration(milliseconds: 1), () {
        try {
          return (expression
              .replaceAll(' ', '')
              .split('
')
              .map((e) => e
                  .replaceAll('+', '+')
                  .replaceAll('-', '-')
                  .replaceAll('*', '*')
                  .replaceAll('/', '/'))
              .join('
')
              .split('
')
              .map((e) => e
                  .contains(RegExp(r'[+*/-]'))
                  ? (()
                  async {
                    var result = await compute(_calculateExpression, e);
                    return result.toString();
                  })()
                  : e)
              .join('
'));
        } catch (e) {
          return 'Error';
        }
      })) as String;
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
            child: Container(
              padding: const EdgeInsets.all(20),
              child: GridView.count(
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String value, Function onPressed) {
    return ElevatedButton(
      onPressed: () => onPressed(value),
      child: Text(
        value,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}