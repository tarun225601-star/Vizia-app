import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _input = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _input = "";
        num1 = 0;
        num2 = 0;
        operand = "";
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        num1 = double.parse(_output);
        operand = buttonText;
        _input = "";
      } else if (buttonText == "=") {
        num2 = double.parse(_output);
        if (operand == "+") {
          _input = (num1 + num2).toString();
        }
        if (operand == "-") {
          _input = (num1 - num2).toString();
        }
        if (operand == "*") {
          _input = (num1 * num2).toString();
        }
        if (operand == "/") {
          _input = num2 != 0 ? (num1 / num2).toString() : "Error";
        }
        _output = _input;
        operand = "";
      } else {
        if (_output == "0") {
          _output = buttonText;
        } else {
          _output = _output + buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText, Color color, Color textColor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(22.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _output,
              style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(children: [
            Row(children: [
              buildButton("7", Colors.grey[850]!, Colors.white),
              buildButton("8", Colors.grey[850]!, Colors.white),
              buildButton("9", Colors.grey[850]!, Colors.white),
              buildButton("/", Colors.orange, Colors.white),
            ]),
            Row(children: [
              buildButton("4", Colors.grey[850]!, Colors.white),
              buildButton("5", Colors.grey[850]!, Colors.white),
              buildButton("6", Colors.grey[850]!, Colors.white),
              buildButton("*", Colors.orange, Colors.white),
            ]),
            Row(children: [
              buildButton("1", Colors.grey[850]!, Colors.white),
              buildButton("2", Colors.grey[850]!, Colors.white),
              buildButton("3", Colors.grey[850]!, Colors.white),
              buildButton("-", Colors.orange, Colors.white),
            ]),
            Row(children: [
              buildButton("C", Colors.redAccent, Colors.white),
              buildButton("0", Colors.grey[850]!, Colors.white),
              buildButton("=", Colors.green, Colors.white),
              buildButton("+", Colors.orange, Colors.white),
            ]),
          ])
        ],
      ),
    );
  }
}
