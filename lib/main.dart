import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _expression = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _expression = '';
      } else if (value == '=') {
        try {
          _expression = _calculate(_expression).toString();
        } catch (e) {
          _expression = 'Error';
        }
      } else {
        _expression += value;
      }
    });
  }

  double _calculate(String expression) {
    expression = expression.replaceAll(' ', '');
    expression = expression.replaceAll('+', '+');
    expression = expression.replaceAll('-', '-');
    expression = expression.replaceAll('*', '*');
    expression = expression.replaceAll('/', '/');

    try {
      return double.parse(expression);
    } catch (e) {
      try {
        return _evaluateExpression(expression);
      } catch (e) {
        throw Exception('Invalid expression');
      }
    }
  }

  double _evaluateExpression(String expression) {
    RegExp exp = RegExp(r'(\d+)');
    var matches = exp.allMatches(expression).map((m) => m.group(0)).toList();

    if (matches.length == 1) {
      return double.parse(matches[0]!);
    }

    List<double> numbers = matches.map((e) => double.parse(e)).toList();
    List<String> operators = expression
        .replaceAll(RegExp(r'\d+'), '')
        .replaceAll(' ', '')
        .split('');

    double result = numbers[0];

    for (var i = 0; i < operators.length; i++) {
      if (operators[i] == '+') {
        result += numbers[i + 1];
      } else if (operators[i] == '-') {
        result -= numbers[i + 1];
      } else if (operators[i] == '*') {
        result *= numbers[i + 1];
      } else if (operators[i] == '/') {
        if (numbers[i + 1] == 0) {
          throw Exception('Division by zero');
        }
        result /= numbers[i + 1];
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              _expression,
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisCount: 4,
              children: [
                _button('7', _onButtonPressed),
                _button('8', _onButtonPressed),
                _button('9', _onButtonPressed),
                _button('/', _onButtonPressed),
                _button('4', _onButtonPressed),
                _button('5', _onButtonPressed),
                _button('6', _onButtonPressed),
                _button('*', _onButtonPressed),
                _button('1', _onButtonPressed),
                _button('2', _onButtonPressed),
                _button('3', _onButtonPressed),
                _button('-', _onButtonPressed),
                _button('0', _onButtonPressed),
                _button('.', _onButtonPressed),
                _button('C', _onButtonPressed),
                _button('+', _onButtonPressed),
                _button('=', _onButtonPressed),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton _button(String label, Function onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurpleAccent,
        padding: const EdgeInsets.all(20),
        textStyle: const TextStyle(fontSize: 24),
      ),
      onPressed: () => onPressed(label),
      child: Text(label),
    );
  }
}