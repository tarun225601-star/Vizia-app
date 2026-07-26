import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator',
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({Key? key}) : super(key: key);

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  final _controller = TextEditingController(text: '');
  double? _result;
  String? _operation;
  String? _firstNumber;
  String? _secondNumber;

  void _calculate() {
    if (_firstNumber != null && _secondNumber != null && _operation != null) {
      final first = double.parse(_firstNumber!);
      final second = double.parse(_secondNumber!);
      switch (_operation) {
        case '+':
          _result = first + second;
          break;
        case '-':
          _result = first - second;
          break;
        case '*':
          _result = first * second;
          break;
        case '/':
          if (second != 0) {
            _result = first / second;
          }
          break;
      }
      setState(() {});
    }
  }

  void _clear() {
    setState(() {
      _controller.text = '';
      _result = null;
      _operation = null;
      _firstNumber = null;
      _secondNumber = null;
    });
  }

  void _appendNumber(String number) {
    if (_operation == null) {
      _firstNumber = _controller.text + number;
    } else {
      _secondNumber = _controller.text + number;
    }
    setState(() {
      _controller.text += number;
    });
  }

  void _appendOperation(String operation) {
    if (_firstNumber != null) {
      setState(() {
        _operation = operation;
        _controller.text += operation;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1,
                children: [
                  ElevatedButton(
                    onPressed: () => _appendNumber('7'),
                    child: const Text('7'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendNumber('8'),
                    child: const Text('8'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendNumber('9'),
                    child: const Text('9'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendOperation('/'),
                    child: const Text('/'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendNumber('4'),
                    child: const Text('4'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendNumber('5'),
                    child: const Text('5'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendNumber('6'),
                    child: const Text('6'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendOperation('*'),
                    child: const Text('*'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendNumber('1'),
                    child: const Text('1'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendNumber('2'),
                    child: const Text('2'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendNumber('3'),
                    child: const Text('3'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendOperation('-'),
                    child: const Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendNumber('0'),
                    child: const Text('0'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendNumber('.'),
                    child: const Text('.'),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendNumber('='),
                    child: const Text('='),
                  ),
                  ElevatedButton(
                    onPressed: () => _appendOperation('+'),
                    child: const Text('+'),
                  ),
                  ElevatedButton(
                    onPressed: _clear,
                    child: const Text('C'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}