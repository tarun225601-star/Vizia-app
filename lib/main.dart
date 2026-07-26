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
  String _result = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operation = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _currentInput = '';
        _result = '';
        _num1 = 0;
        _num2 = 0;
        _operation = '';
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
        _num1 = double.parse(_currentInput);
        _operation = buttonText;
        _currentInput = '';
      } else if (buttonText == '=') {
        _num2 = double.parse(_currentInput);
        if (_operation == '+') {
          _result = (_num1 + _num2).toString();
        } else if (_operation == '-') {
          _result = (_num1 - _num2).toString();
        } else if (_operation == '*') {
          _result = (_num1 * _num2).toString();
        } else if (_operation == '/') {
          _result = (_num1 / _num2).toString();
        }
        _currentInput = '';
      } else {
        _currentInput += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              _currentInput + _result,
              style: TextStyle(fontSize: 24),
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
  final String _buttonText;
  final Function _onButtonPressed;

  CalculatorButton(this._buttonText, this._onButtonPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onButtonPressed(_buttonText),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            _buttonText,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
