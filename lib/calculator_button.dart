import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String value;
  final Function(String) onPressed;

  const CalculatorButton({Key? key, required this.value, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(value),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}