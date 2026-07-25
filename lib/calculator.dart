import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String _expression = '';
  String _result = '';
  final List<String> _buttons = [
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    '0', '.', '=', '+
  ];

  void _calculate(String button) {
    if (button == '=') {
      try {
        _result = _calculateExpression(_expression);
      } catch (e) {
        _result = 'Error';
      }
    } else if (button == 'C') {
      _expression = '';
      _result = '';
    } else {
      _expression += button;
    }
    setState(() {});
  }

  String _calculateExpression(String expression) {
    return expression
        .replaceAll(' ', '')
        .replaceAll('+', ' + ')
        .replaceAll('-', ' - ')
        .replaceAll('*', ' * ')
        .replaceAll('/', ' / ')
        .split(' ').join()
        .toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20),
                child: Text(
                  _expression + (_result.isEmpty ? '' : ' = $_result'),
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1.2,
                children: _buttons.map((button) {
                  return ElevatedButton(
                    onPressed: () => _calculate(button),
                    child: Text(button),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () => _calculate('C'),
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}