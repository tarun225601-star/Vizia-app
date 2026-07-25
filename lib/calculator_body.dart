import 'package:flutter/material.dart';

class CalculatorBody extends StatefulWidget {
  final String expression;
  final String result;
  final Function onCalculate;

  const CalculatorBody({
    Key? key,
    required this.expression,
    required this.result,
    required this.onCalculate,
  }) : super(key: key);

  @override
  State<CalculatorBody> createState() => _CalculatorBodyState();
}

class _CalculatorBodyState extends State<CalculatorBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: Text(
              widget.expression,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: Text(
              widget.result,
              style: const TextStyle(fontSize: 48),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: GridView.count(
            crossAxisCount: 4,
            childAspectRatio: 1.2,
            children: [
              CalculatorButton(
                label: '7',
                onTap: () {
                  widget.onCalculate('7');
                },
              ),
              CalculatorButton(
                label: '8',
                onTap: () {
                  widget.onCalculate('8');
                },
              ),
              CalculatorButton(
                label: '9',
                onTap: () {
                  widget.onCalculate('9');
                },
              ),
              CalculatorButton(
                label: '/',
                onTap: () {
                  widget.onCalculate('/');
                },
              ),
              CalculatorButton(
                label: '4',
                onTap: () {
                  widget.onCalculate('4');
                },
              ),
              CalculatorButton(
                label: '5',
                onTap: () {
                  widget.onCalculate('5');
                },
              ),
              CalculatorButton(
                label: '6',
                onTap: () {
                  widget.onCalculate('6');
                },
              ),
              CalculatorButton(
                label: '*',
                onTap: () {
                  widget.onCalculate('*');
                },
              ),
              CalculatorButton(
                label: '1',
                onTap: () {
                  widget.onCalculate('1');
                },
              ),
              CalculatorButton(
                label: '2',
                onTap: () {
                  widget.onCalculate('2');
                },
              ),
              CalculatorButton(
                label: '3',
                onTap: () {
                  widget.onCalculate('3');
                },
              ),
              CalculatorButton(
                label: '-',
                onTap: () {
                  widget.onCalculate('-');
                },
              ),
              CalculatorButton(
                label: '0',
                onTap: () {
                  widget.onCalculate('0');
                },
              ),
              CalculatorButton(
                label: '.',
                onTap: () {
                  widget.onCalculate('.');
                },
              ),
              CalculatorButton(
                label: '=',
                onTap: () {
                  widget.onCalculate('=');
                },
              ),
              CalculatorButton(
                label: '+',
                onTap: () {
                  widget.onCalculate('+');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}