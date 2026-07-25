import 'package:flutter/material.dart';
import 'package:calculator_app/calculator_logic.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final CalculatorLogic _calculatorLogic = CalculatorLogic();
  String _expression = '';
  String _result = '';

  void _onButtonPressed(String buttonValue) {
    setState(() {
      if (buttonValue == 'C') {
        _expression = '';
        _result = '';
      } else if (buttonValue == '=') {
        _result = _calculatorLogic.calculate(_expression);
      } else {
        _expression += buttonValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _expression,
                    style: const TextStyle(fontSize: 24),
                  ),
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
            child: Container(
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1.2,
                children: [
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '7',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '8',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '9',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '/',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '4',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '5',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '6',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '*',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '1',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '2',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '3',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '-',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '0',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '.',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '=',
                  ),
                  CalculatorButton(
                    onPressed: _onButtonPressed,
                    buttonValue: '+',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}