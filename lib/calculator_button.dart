import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Function onPressed;
  final String buttonValue;

  const CalculatorButton({Key? key, required this.onPressed, required this.buttonValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(buttonValue),
      child: Text(
        buttonValue,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}