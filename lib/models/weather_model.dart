import 'package:flutter/material.dart';


class Weather {
  final String city;
  final String updateTime;
  final String weatherState;
  final String temperatureIcon;

  final double temperature;
  final double maxTemperature;
  final double minTemperature;

  Weather({
    required this.city,
    required this.updateTime,
    required this.weatherState,
    required this.temperature,
    required this.maxTemperature,
    required this.minTemperature,
    required this.temperatureIcon,
  });
}
