import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final _cityController = TextEditingController();
  String _weather = '';
  String _description = '';
  String _temperature = '';
  String _humidity = '';
  String _windSpeed = '';

  void _getWeather(String city) async {
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=YOUR_API_KEY&units=metric'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      setState(() {
        _weather = json['weather'][0]['main'];
        _description = json['weather'][0]['description'];
        _temperature = json['main']['temp'].toString();
        _humidity = json['main']['humidity'].toString();
        _windSpeed = json['wind']['speed'].toString();
      });
    } else {
      setState(() {
        _weather = 'Error';
        _description = 'Failed to load weather data';
        _temperature = '';
        _humidity = '';
        _windSpeed = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _getWeather(_cityController.text);
              },
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            Text(
              'Weather: $_weather',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Description: $_description',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Temperature: $_temperatureÂ°C',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Humidity: $_humidity%',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Wind Speed: $_windSpeed m/s',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}