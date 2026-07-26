import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _currentInput = '';
  String _currentResult = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';

  void _onButtonPressed(String buttonValue) {
    setState(() {
      if (buttonValue == 'C') {
        _currentInput = '';
        _currentResult = '';
        _num1 = 0;
        _num2 = 0;
        _operator = '';
      } else if (buttonValue == '+' || buttonValue == '-' || buttonValue == '*' || buttonValue == '/') {
        _num1 = double.parse(_currentInput);
        _operator = buttonValue;
        _currentInput = '';
      } else if (buttonValue == '=') {
        _num2 = double.parse(_currentInput);
        if (_operator == '+') {
          _currentResult = (_num1 + _num2).toString();
        } else if (_operator == '-') {
          _currentResult = (_num1 - _num2).toString();
        } else if (_operator == '*') {
          _currentResult = (_num1 * _num2).toString();
        } else if (_operator == '/') {
          _currentResult = (_num1 / _num2).toString();
        }
        _currentInput = '';
      } else {
        _currentInput += buttonValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              _currentInput + _currentResult,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
              children: [
                ElevatedButton(
                  onPressed: () => _onButtonPressed('7'),
                  child: Text('7'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('8'),
                  child: Text('8'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('9'),
                  child: Text('9'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('/'),
                  child: Text('/'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('4'),
                  child: Text('4'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('5'),
                  child: Text('5'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('6'),
                  child: Text('6'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('*'),
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('1'),
                  child: Text('1'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('2'),
                  child: Text('2'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('3'),
                  child: Text('3'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('-'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('0'),
                  child: Text('0'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('.'),
                  child: Text('.'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('='),
                  child: Text('='),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('C'),
                  child: Text('C'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
