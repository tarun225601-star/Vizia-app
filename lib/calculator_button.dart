import 'package:flutter/material.dart';

typedef void OnPressed(String value);

class CalculatorButton extends StatelessWidget {
  final OnPressed _onPressed;
  final String _value;

  const CalculatorButton({Key? key, required OnPressed onPressed, required String value})
      : _onPressed = onPressed,
        _value = value,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onPressed(_value),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            _value,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}