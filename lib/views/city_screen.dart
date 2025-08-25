import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/views/search_screen.dart';

class CityScreen extends StatefulWidget {
  final String cityName;
  CityScreen({super.key, required this.cityName});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  Weather? weather;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  void didUpdateWidget(covariant CityScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cityName != widget.cityName) {
      getWeatherData();
    }
  }

  Future<void> getWeatherData() async {
    setState(() {
      isLoading = true;
    });

    try {
      weather = await WeatherService(Dio()).getWeather(widget.cityName);
    } on Exception catch (e) {
      weather = null;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Weather App')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    if (weather == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Weather App')),
        body: const Center(
          child: Text(
            'Error fetching weather data. Please try again.',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final newCity = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );

              if (newCity != null && newCity is String) {
                setState(() {
                  weather = null;
                  isLoading = true;
                });
                try {
                  weather = await WeatherService(Dio()).getWeather(newCity);
                } catch (e) {
                  weather = null;
                }
                setState(() {
                  isLoading = false;
                });
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfffe9903),
              Color(0xfffea621),
              Color(0xfffeb447),
              Color(0xfffecc83),
              Color(0xffffe0b2),
              Color(0xfffeefd8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text(
              weather!.city,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Updated at ${weather!.updateTime.split(" ")[1]}',
              style: TextStyle(
                fontSize: 24,
                // fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  "https:${weather!.temperatureIcon}",
                  width: 60,
                  height: 60,
                ),
                Text(
                  ' ${weather!.temperature}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weather!.maxTemperature}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weather!.minTemperature}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              weather!.weatherState,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
