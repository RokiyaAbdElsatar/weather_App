import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  Future<Weather> getWeather(String cityName) async {
    try {
      var response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=YOUR_API_KEY&q=$cityName&days=1',
      );
      final json = response.data;

      final city = json["location"]["name"];
      final updateTime = json["current"]["last_updated"];
      final weatherState = json["current"]["condition"]["text"];
      final temperature = json["current"]["temp_c"];
      final maxTemperature =
          json["forecast"]["forecastday"][0]["day"]["maxtemp_c"];
      final minTemperature =
          json["forecast"]["forecastday"][0]["day"]["mintemp_c"];
      final temperatureIcon = json["current"]["condition"]["icon"];

      return Weather(
        city: city,
        updateTime: updateTime,
        weatherState: weatherState,
        temperature: temperature,
        maxTemperature: maxTemperature,
        minTemperature: minTemperature,
        temperatureIcon: temperatureIcon,
      );
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
