import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final List<String> _buttons = [
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '*',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+'
  ];
  String _expression = '';
  String _result = '';

  void _onButtonPressed(String button) {
    setState(() {
      if (button == '=') {
        try {
          _result = _calculate(_expression).toString();
          _expression = _result;
        } catch (e) {
          _result = 'Error';
          _expression = '';
        }
      } else if (button == 'C') {
        _expression = '';
        _result = '';
      } else {
        _expression += button;
      }
    });
  }

  double _calculate(String expression) {
    return expr.eval(expression);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      _expression.isEmpty ? '' : _expression,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      _result.isEmpty ? '' : _result,
                      style: const TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
              ),
              itemCount: _buttons.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onButtonPressed(_buttons[index]),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: _buttons[index] == '='
                          ? Colors.blueAccent
                          : Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        _buttons[index],
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

dynamic expr;

void setupExpr() {
  expr = Expression();
}

class Expression {
  double eval(String expression) {
    return _eval(expression);
  }

  double _eval(String expression) {
    expression = expression.replaceAll(' ', '');
    var left = _parseFactor(expression);
    var op = _getOperator(expression.substring(left['len']));
    while (op != null) {
      var right = _parseFactor(expression.substring(left['len'] + op['len']));
      left['value'] = _applyOp(left['value'], op['op'], right['value']);
      left['len'] += op['len'] + right['len'];
      op = _getOperator(expression.substring(left['len']));
    }
    return left['value'];
  }

  Map<String, dynamic> _parseFactor(String expression) {
    RegExpMatch? match = RegExp(r'^(\d+(\.\d+)?|\.\d+)(e[+-]?\d+)?').firstMatch(expression);
    if (match != null) {
      return {'value': double.parse(match.group(0)!), 'len': match.group(0)!.length};
    } else {
      return {'value': 0, 'len': 0};
    }
  }

  Map<String, dynamic>? _getOperator(String expression) {
    if (expression.startsWith('+')) return {'op': (a, b) => a + b, 'len': 1};
    if (expression.startsWith('-')) return {'op': (a, b) => a - b, 'len': 1};
    if (expression.startsWith('*')) return {'op': (a, b) => a * b, 'len': 1};
    if (expression.startsWith('/')) return {'op': (a, b) => a / b, 'len': 1};
    return null;
  }

  double _applyOp(double a, Function op, double b) {
    return op(a, b);
  }
}

void main2() {
  setupExpr();
  print(expr.eval("1 + 2 * 3")); // prints 7.0
  print(expr.eval("1 + 2 / 3")); // prints 1.6666666666666667
  print(expr.eval("10 - 2 * 3")); // prints 4.0
}