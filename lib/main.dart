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
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _cityController = TextEditingController();
  String _weatherInfo = '';
  String _cityName = '';

  Future<void> _getWeatherInfo() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${_cityController.text}&appid=YOUR_API_KEY&units=metric'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        _weatherInfo = 'Temperature: ${jsonData['main']['temp']}Â°C\n'
            'Feels like: ${jsonData['main']['feels_like']}Â°C\n'
            'Humidity: ${jsonData['main']['humidity']}%\n'
            'Wind speed: ${jsonData['wind']['speed']} m/s\n'
            'Weather condition: ${jsonData['weather'][0]['description']}';
        _cityName = jsonData['name'];
      });
    } else {
      setState(() {
        _weatherInfo = 'Failed to load weather info';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'City name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _getWeatherInfo,
            child: const Text('Get weather info'),
          ),
          const SizedBox(height: 16),
          Text(
            _cityName.isEmpty ? '' : _cityName,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          Text(_weatherInfo),
        ],
      ),
    );
  }
}