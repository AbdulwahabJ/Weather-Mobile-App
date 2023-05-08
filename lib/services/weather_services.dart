///
///
///
///
///
///

// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  //
  String baseUrl = 'http://api.weatherapi.com/v1';
  //
  String apiKey = 'ceaccd3863e14bdb976105909230202';
  WeatherModel? Weather;

  Future<WeatherModel?> getWeather({required String cityName}) async {
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      //
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);
      //

      Weather = WeatherModel.fromJson(data);
      // print(data);
      //
    } catch (e) {
      print(e);
    }
    return Weather;
  }
}
