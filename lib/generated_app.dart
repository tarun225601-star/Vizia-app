import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Race Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarRaceGame(),
    );
  }
}

class CarRaceGame extends StatefulWidget {
  @override
  _CarRaceGameState createState() => _CarRaceGameState();
}

class _CarRaceGameState extends State<CarRaceGame> {
  double _car1Position = 0;
  double _car2Position = 0;
  bool _isGameStarted = false;
  Random _random = Random();

  void _startGame() {
    setState(() {
      _isGameStarted = true;
    });
    _updateCarPositions();
  }

  void _updateCarPositions() {
    if (_isGameStarted) {
      setState(() {
        _car1Position += _random.nextDouble() * 10;
        _car2Position += _random.nextDouble() * 10;
      });
      if (_car1Position >= 300 || _car2Position >= 300) {
        _endGame();
      } else {
        Future.delayed(Duration(milliseconds: 100), _updateCarPositions);
      }
    }
  }

  void _endGame() {
    setState(() {
      _isGameStarted = false;
    });
    if (_car1Position > _car2Position) {
      _showDialog('Car 1 wins!');
    } else if (_car2Position > _car1Position) {
      _showDialog('Car 2 wins!');
    } else {
      _showDialog('It\'s a tie!');
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('Play Again'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _car1Position = 0;
                  _car2Position = 0;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Race Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Car 1: ${_car1Position.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Car 2: ${_car2Position.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _isGameStarted ? null : _startGame,
              child: Text(_isGameStarted ? 'Game Started' : 'Start Game'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: _car1Position,
                        child: Container(
                          width: 20,
                          height: 20,
                          color: Colors.red,
                        ),
                      ),
                      Positioned(
                        left: _car2Position,
                        child: Container(
                          width: 20,
                          height: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}