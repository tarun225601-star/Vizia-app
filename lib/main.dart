import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorPage(),
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
          .split(' ')
          .map((e) => double.parse(e))
          .reduce((a, b) {
            if (input.contains('+')) {
              return (a + b).toString();
            } else if (input.contains('-')) {
              return (a - b).toString();
            } else if (input.contains('*')) {
              return (a * b).toString();
            } else if (input.contains('/')) {
              return (a / b).toString();
            } else {
              return '0';
            }
          })
          .toString();
    } catch (e) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                _currentInput.isEmpty ? '0' : _currentInput,
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                _result.isEmpty ? '' : _result,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
              children: [
                ElevatedButton(
                  onPressed: () => _onButtonPressed('7'),
                  child: const Text('7'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('8'),
                  child: const Text('8'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('9'),
                  child: const Text('9'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('/'),
                  child: const Text('/'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('4'),
                  child: const Text('4'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('5'),
                  child: const Text('5'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('6'),
                  child: const Text('6'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('1'),
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('2'),
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('3'),
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('0'),
                  child: const Text('0'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('.'),
                  child: const Text('.'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('='),
                  child: const Text('='),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _onButtonPressed('C'),
                  child: const Text('C'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}