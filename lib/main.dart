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
        (String input) => input
            .replaceAll(' ', '')
            .split('
')
            .map((e) => e)
            .reduce((value, element) => value + element),
        [input],
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
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                _currentInput.isEmpty ? '0' : _currentInput,
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                _result.isEmpty ? '' : _result,
                style: const TextStyle(fontSize: 30),
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
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                )),
                ...['4', '5', '6', '*'].map((e) => InkWell(
                  onTap: () => _onButtonPressed(e),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                )),
                ...['1', '2', '3', '-'].map((e) => InkWell(
                  onTap: () => _onButtonPressed(e),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                )),
                ...['0', '.', '=', 'C'].map((e) => InkWell(
                  onTap: () => _onButtonPressed(e),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                )),
                ...['+', '+'].map((e) => InkWell(
                  onTap: () => _onButtonPressed(e),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
