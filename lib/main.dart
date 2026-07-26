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
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _currentInput = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _currentInput = '';
        _result = '';
      } else if (value == '=') {
        try {
          _result = _calculateResult(_currentInput);
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _currentInput += value;
      }
    });
  }

  String _calculateResult(String input) {
    try {
      return input
          .replaceAll(' ', '')
          .replaceAll('+', ' + ')
          .replaceAll('-', ' - ')
          .replaceAll('*', ' * ')
          .replaceAll('/', ' / ')
          .split(' ').map((e) => double.parse(e)).reduce((a, b) {
        final operator = input.substring(input.indexOf(a.toString()) + a.toString().length, input.indexOf(b.toString()));
        switch (operator) {
          case '+':
            return a + b;
          case '-':
            return a - b;
          case '*':
            return a * b;
          case '/':
            return a / b;
          default:
            throw Exception('Invalid operator');
        }
      }).toStringAsFixed(2);
    } catch (e) {
      throw Exception('Invalid input');
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
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFf0f0f0),
          borderRadius: BorderRadius.circular(10),
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