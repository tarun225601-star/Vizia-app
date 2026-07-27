import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final _cityController = TextEditingController();
  String _weatherDescription = '';
  String _temperature = '';
  String _humidity = '';
  String _windSpeed = '';
  String _error = '';

  Future<void> _getWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${_cityController.text}&appid=YOUR_API_KEY&units=metric'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        _weatherDescription = jsonData['weather'][0]['description'];
        _temperature = '${jsonData['main']['temp']}Â°C';
        _humidity = '${jsonData['main']['humidity']}%';
        _windSpeed = '${jsonData['wind']['speed']} m/s';
        _error = '';
      });
    } else {
      setState(() {
        _error = 'Failed to get weather data';
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
              onPressed: _getWeather,
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            Text(
              _weatherDescription,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              _temperature,
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text('Humidity'),
                    Text(
                      _humidity,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Wind Speed'),
                    Text(
                      _windSpeed,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _error,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}