import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _expression = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _expression = '';
        _result = '';
      } else if (value == '=') {
        try {
          _result = _calculate(_expression);
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _expression += value;
      }
    });
  }

  String _calculate(String expression) {
    final List<String> tokens = expression.split(RegExp(r'(\+|-|\*|\/)'));
    double result = double.parse(tokens[0]);
    for (int i = 1; i < tokens.length; i += 2) {
      final String operator = tokens[i];
      final double operand = double.parse(tokens[i + 1]);
      switch (operator) {
        case '+':
          result += operand;
          break;
        case '-':
          result -= operand;
          break;
        case '*':
          result *= operand;
          break;
        case '/':
          if (operand != 0) {
            result /= operand;
          } else {
            throw Exception('Division by zero');
          }
          break;
      }
    }
    return result.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  _expression,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  _result,
                  style: const TextStyle(fontSize: 48),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              childAspectRatio: 1.2,
              children: [
                _buildButton('7', _onButtonPressed),
                _buildButton('8', _onButtonPressed),
                _buildButton('9', _onButtonPressed),
                _buildButton('/', _onButtonPressed),
                _buildButton('4', _onButtonPressed),
                _buildButton('5', _onButtonPressed),
                _buildButton('6', _onButtonPressed),
                _buildButton('*', _onButtonPressed),
                _buildButton('1', _onButtonPressed),
                _buildButton('2', _onButtonPressed),
                _buildButton('3', _onButtonPressed),
                _buildButton('-', _onButtonPressed),
                _buildButton('0', _onButtonPressed),
                _buildButton('.', _onButtonPressed),
                _buildButton('C', _onButtonPressed),
                _buildButton('+', _onButtonPressed),
                _buildButton('=', _onButtonPressed),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String value, Function onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: value == '='
              ? Colors.blueAccent
              : value == 'C'
                  ? Colors.redAccent
                  : null,
        ),
        onPressed: () => onPressed(value),
        child: Text(
          value,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}