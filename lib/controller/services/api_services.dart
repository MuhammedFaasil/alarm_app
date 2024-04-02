import 'dart:convert';

import 'package:alarm_app/utils/api_utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<String> getWeather() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=${ApiUtils.apiKey}&units=metric'));
    if (response.statusCode == 200) {
      Map<String, dynamic> weatherData = json.decode(response.body);
      double temperature = weatherData['main']['temp'];
      return temperature.toStringAsFixed(1);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
