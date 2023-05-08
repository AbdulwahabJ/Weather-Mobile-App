// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weathercubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/services/weather_services.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherServices());
      },
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
        //     ? Colors.deepOrange
        //     : Provider.of<WeatherProvider>(context)
        //         .weatherData!
        //         .getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
