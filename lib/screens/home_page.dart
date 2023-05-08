// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weathercubit/weather_cubit.dart';
import 'package:weather_app/cubits/weathercubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';

import '../provider/weather_provider.dart';
import 'search_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchScreen();
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoding) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weather;
            return SuccessBody(weatherData, context);
          } else if (state is WeatherFailuer) {
            return Center(
              child: Text('ther is no result'),
            );
          } else {
            return DefaultBody();
          }
        },
      ),
    );
  }

  Center DefaultBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'searching now 🔍 ',
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }

  Container SuccessBody(WeatherModel? weatherData, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData!.getThemeColor(),
            weatherData.getThemeColor()[300]!,
            weatherData.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      // color: weatherData.getThemeColor(),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 3),
          Text(
            Provider.of<WeatherProvider>(context, listen: false)
                .cityName!
                .toUpperCase(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ' updated at  ${weatherData.date.hour.toString()}: ${weatherData.date.minute.toString()}',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(weatherData.getImage()),
              Text(
                weatherData.temp.toString(),
                style: TextStyle(fontSize: 30),
              ),
              Column(
                children: [
                  Text('max:${weatherData.maxTemp.toInt()}',
                      style: TextStyle(fontSize: 16)),
                  Text(
                    'min: ${weatherData.minTemp.toInt()}',
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          Text(
            weatherData.weatherStateName,
            // weatherData?.weatherStateName ?? '',

            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Spacer(flex: 5),
        ],
      ),
    );
  }
}
