import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _currentInput = '';
  String _result = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';

  void _onButtonPressed(String buttonValue) {
    setState(() {
      if (buttonValue == 'C') {
        _currentInput = '';
        _result = '';
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
          _result = (_num1 + _num2).toString();
        } else if (_operator == '-') {
          _result = (_num1 - _num2).toString();
        } else if (_operator == '*') {
          _result = (_num1 * _num2).toString();
        } else if (_operator == '/') {
          if (_num2 != 0) {
            _result = (_num1 / _num2).toString();
          } else {
            _result = 'Error';
          }
        }
        _currentInput = _result;
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
              _currentInput.isEmpty ? '0' : _currentInput,
              style: TextStyle(fontSize: 40),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
              children: [
                CalculatorButton('7', _onButtonPressed),
                CalculatorButton('8', _onButtonPressed),
                CalculatorButton('9', _onButtonPressed),
                CalculatorButton('/', _onButtonPressed),
                CalculatorButton('4', _onButtonPressed),
                CalculatorButton('5', _onButtonPressed),
                CalculatorButton('6', _onButtonPressed),
                CalculatorButton('*', _onButtonPressed),
                CalculatorButton('1', _onButtonPressed),
                CalculatorButton('2', _onButtonPressed),
                CalculatorButton('3', _onButtonPressed),
                CalculatorButton('-', _onButtonPressed),
                CalculatorButton('0', _onButtonPressed),
                CalculatorButton('.', _onButtonPressed),
                CalculatorButton('=', _onButtonPressed),
                CalculatorButton('+', _onButtonPressed),
                CalculatorButton('C', _onButtonPressed),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String _buttonValue;
  final Function _onButtonPressed;

  CalculatorButton(this._buttonValue, this._onButtonPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onButtonPressed(_buttonValue),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            _buttonValue,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(CalculatorApp());
}