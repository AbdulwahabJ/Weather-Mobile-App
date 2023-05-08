// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unused_catch_clause, empty_catches

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weathercubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchScreen extends StatelessWidget {
  //
  //
  //
  String? cityName;
  WeatherServices service = WeatherServices();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Search a City'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              //
              onChanged: (data) {
                cityName = data;
              },
              //
              onSubmitted: (data) async {
                cityName = data;

                BlocProvider.of<WeatherCubit>(context)
                    .getWeather(CityName: cityName!);
                Navigator.pop(context);
              },
              //
              //InputDecoration/=/
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                label: Text('search'),
                //
                suffixIcon: GestureDetector(
                  child: Icon(Icons.search),
                  onTap: () async {
                    Provider.of<WeatherProvider>(context, listen: false)
                            .weatherData =
                        await service.getWeather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;
                    Navigator.pop(context);
                  },
                ),
                //
                hintText: 'Enter the city',
                //OutlineInputBorder//
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.orange),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
