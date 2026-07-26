import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _currentInput = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _currentInput = '';
        _result = '';
      } else if (value == '=') {
        try {
          _result = _calculate(_currentInput).toString();
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _currentInput += value;
      }
    });
  }

  double _calculate(String input) {
    try {
      return Function.apply(
        {'+': (a, b) => a + b, '-': (a, b) => a - b, '*': (a, b) => a * b, '/': (a, b) => a / b}[input.contains('+') ? '+' : input.contains('-') ? '-' : input.contains('*') ? '*' : '/'],
        [double.parse(input.split(RegExp('[+\-*/]'))[0]), double.parse(input.split(RegExp('[+\-*/]'))[1])],
      );
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
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _result.isEmpty ? _currentInput : _result,
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
              children: [
                ...['7', '8', '9', '/'].map((e) => InkWell(
                  onTap: () => _onButtonPressed(e),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(child: Text(e, style: const TextStyle(fontSize: 24))),
                  ),
                )),
                ...['4', '5', '6', '*'].map((e) => InkWell(
                  onTap: () => _onButtonPressed(e),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(child: Text(e, style: const TextStyle(fontSize: 24))),
                  ),
                )),
                ...['1', '2', '3', '-'].map((e) => InkWell(
                  onTap: () => _onButtonPressed(e),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(child: Text(e, style: const TextStyle(fontSize: 24))),
                  ),
                )),
                ...['0', '.', '=', '+'].map((e) => InkWell(
                  onTap: () => _onButtonPressed(e),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(child: Text(e, style: const TextStyle(fontSize: 24))),
                  ),
                )),
                InkWell(
                  onTap: () => _onButtonPressed('C'),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.red,
                    ),
                    child: const Center(child: Text('C', style: TextStyle(fontSize: 24, color: Colors.white))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}