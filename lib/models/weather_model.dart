// ignore_for_file: non_constant_identifier_names, unnecessary_string_escapes, curly_braces_in_flow_control_structures

import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      // date: data['location']['localtime'],
      date: DateTime.parse(data['location']['localtime']),

      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
    );
  }

  @override
  String toString() {
    return 'temp:$temp';
  }

  String getImage() {
    if (weatherStateName == 'sunny') {
      return 'assets/images/clear.png';
    }
    // ignore: dead_code
    else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Patchy rain possible') {
      return 'assets/images/snow.png';
    }
//
    else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Partly cloudy') {
      return 'assets/images/cloudy.png';
    }
//
    else if (weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    }
    //

    else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return 'assets/images/thunderstrom.png';
    }
    //end

    else {
      return 'assets/images/clear.png';
    }
  }

  //

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny') {
      return Colors.orange;
    }
    // ignore: dead_code
    else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Patchy rain possible') {
      return Colors.cyan;
    }
//
    else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Partly cloudy') {
      return Colors.grey;
    }
//
    else if (weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    }
    //

    else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return Colors.yellow;
    }
    //end

    else {
      return Colors.green;
    }
  }
}
